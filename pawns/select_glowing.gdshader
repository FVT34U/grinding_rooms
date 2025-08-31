shader_type canvas_item;

uniform bool enabled = false;
uniform int thickness : hint_range(1, 12) = 1;          // Толщина обводки
uniform vec4 outline_color : source_color = vec4(0,0,0,1);
uniform float alpha_threshold : hint_range(0.0,1.0) = 0.5;
uniform float pulse_speed : hint_range(0.1, 10.0) = 1.0; // Скорость мерцания

void fragment() {
    vec4 base = texture(TEXTURE, UV);
    vec4 result_color = vec4(0.0);

    // вычисляем коэффициент "пульсации" от 0 до 1
    float pulse = (sin(TIME * pulse_speed) * 0.5) + 0.5;

    // итоговая альфа для обводки
    float animated_alpha = outline_color.a * pulse;

    if (base.a > alpha_threshold || !enabled) {
        result_color = base;
    } else {
        vec2 ps = TEXTURE_PIXEL_SIZE;
        float max_alpha = 0.0;

        const int MAX_T = 12;
        int r = min(thickness, MAX_T);

        for (int x = -MAX_T; x <= MAX_T; x++) {
            for (int y = -MAX_T; y <= MAX_T; y++) {
                if (abs(x) > r || abs(y) > r) { continue; }
                if (x*x + y*y > r*r) { continue; }
                vec2 offset = vec2(float(x), float(y)) * ps;
                float a = texture(TEXTURE, UV + offset).a;
                max_alpha = max(max_alpha, a);
            }
        }

        if (max_alpha > alpha_threshold) {
            result_color = vec4(outline_color.rgb, animated_alpha);
        }
    }

    COLOR = result_color;
}