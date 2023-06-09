module main

import cfx
import sdl

fn main() {
	sdl.init(0)
	defer {sdl.quit()}

	win := sdl.create_window('game'.str, sdl.windowpos_centered, sdl.windowpos_centered, 960, 540, 0)
	defer {sdl.destroy_window(win)}

	ren := sdl.create_renderer(win, -1, u32(sdl.RendererFlags.accelerated))
	defer {sdl.destroy_renderer(ren)}

	mut running := true
	ev := sdl.Event{}
	for running {
	for 0 < sdl.poll_event(&ev) {
		match ev.@type {
			.quit {
				running = false
			}
			else {}
		}
	}

	sdl.set_render_draw_color(ren, 0, 0, 0, 255)
	sdl.render_clear(ren)

	cfx.fill_circle(ren, 200, 300, 100, 0xff0000ff)
	cfx.draw_circle(ren, 300, 200, 100, 0x00ffffff)

	sdl.render_present(ren)

	sdl.delay(1000/60)
	}
}
