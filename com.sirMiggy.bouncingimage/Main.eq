
/*
 * Main.eq
 * Generated by Eqela Studio 2.0b7.4
 */

public class Main: SEScene
{
	SESprite bg;
	SESprite fg;
	SEImage img;
	bool directlr = true;
	bool directtb = true;
	int speed = 100;
	double rotation = 0;
	SESprite text;
	String display;
	int bounce = 0;
	
	public void initialize(SEResourceCache rsc)
	{
		base.initialize(rsc);
		img.for_resource("app");
		
		bg= add_sprite_for_color(Color.instance("lightgreen"),get_scene_width(),get_scene_height());
		bg.move(0,0);

		rsc.prepare_image("img","Helmet_pig",get_scene_width()*0.1,get_scene_height()*0.1);
		fg= add_sprite_for_image(SEImage.for_resource("img"));//add_sprite_for_color(Color.instance("white"),get_scene_width()*0.1,get_scene_height()*0.1); ////
		fg.move(100,100);

	
		rsc.prepare_font("myfont","arial bold color=white",100);
		display = "BOUNCE = %d".printf().add(Primitive.for_integer(bounce)).to_string();
		text= add_sprite_for_text(display,"myfont");
		text.move(0,get_scene_height()-text.get_height());

	
	}
	public void update(TimeVal now,double delta) {
	rotation+=MathConstant.M_PI_4/2;
	fg.set_rotation(rotation);
	speed+=50;
	
		if(directlr) {
			 if( fg.get_x()+fg.get_width() > get_scene_width() ) {
				directlr = false;
				speed=100;
				bounce++;
				text.set_text(display);
			
			}
				fg.move(fg.get_x()+delta*speed,fg.get_y());
		}
		else {
			if(fg.get_x() < 0) {
								directlr = true;
								speed=100;
								bounce++;
								text.set_text(display);
			}
			fg.move(fg.get_x()-delta*speed,fg.get_y());	
		}
		

		if(directtb) {
			 if( fg.get_y()+fg.get_height() > get_scene_height() ) {
				directtb = false;
				speed=100;
				bounce++;
				text.set_text(display);
			
			}
				fg.move(fg.get_x(),fg.get_y()+delta*speed);
		}
		else {
			if(fg.get_y() < 0) {
								directtb = true;
								speed=100;
							bounce++;
				text.set_text(display);
			}
			fg.move(fg.get_x(),fg.get_y()-delta*speed);	
		}

		display = "BOUNCE = %d".printf().add(Primitive.for_integer(bounce)).to_string();
	}

	public void set_rotation(double angle) {
		rotation=angle;
	}

	public double get_rotation() {
		return(rotation);
	}
}