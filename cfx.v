module cfx

import sdl

[inline]
fn get_color_bit(color u32, bit u8) u8 {
	return u8((color >> (8 * bit)) & 0xFF)
}

pub fn fill_circle(ren &sdl.Renderer, cx int, cy int, r int, color u32) {
	if r == 0 {return}

	sdl.set_render_draw_color(ren, 
		get_color_bit(color, 3),
		get_color_bit(color, 2),
		get_color_bit(color, 1),
		get_color_bit(color, 0)
	)

	mut x := cx - r
	mut y := cy - r
	for y <= cy + r {
		dy := y - cy
		x = cx - r
		for x <= cx + r {
			dx := x - cx
			if (dx*dx) + (dy*dy) <= (r*r) {
				sdl.render_draw_point(ren, x, y)
			}
			x++
		}
		y++
	}
}

pub fn draw_circle(ren &sdl.Renderer, cx int, cy int, r int, color u32) {
	if r == 0 {return}

	sdl.set_render_draw_color(ren,
		get_color_bit(color, 3),
		get_color_bit(color, 2),
		get_color_bit(color, 1),
		get_color_bit(color, 0)
	)

	mut x := cx - r
	mut y := cy - r
	for y <= cy + r {
		dy := y - cy
		x = cx - r
		for x <= cx + r {
			dx := x - cx
			dz := (dx*dx) + (dy*dy)
			if dz > r * (r - 1) && dz < r * (r + 1) {
				sdl.render_draw_point(ren, x, y)
			}
			x++
		}
		y++
	}
}
