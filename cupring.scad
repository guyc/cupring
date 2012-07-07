
include </Users/guy/replicator/cupring/artwork.scad>

topInnerRadius    = 1+78.5/2;
bottomInnerRadius = 1+77.0/2;
ringHeight        = 10.0;
ringThickness     =  1.5;
recessDepth       =  0.5;
textRepeat        = 2;

$fn = 100;

module ring()
{
		difference() {
			cylinder(h=ringHeight, r1=bottomInnerRadius+ringThickness, r2=topInnerRadius+ringThickness, center=true);
			cylinder(h=ringHeight+1, r1=bottomInnerRadius, r2=topInnerRadius, center=true);

		}
}

module baseText()
{
	s = (bottomInnerRadius)/100.0;
	scale([s,s,s])
	    rotate(a=90, v=[1,0,0])
			artwork();		
}

module text()
{
  for (i = [0 : textRepeat]) 
  {
    rotate(a=360*i/textRepeat, v=[0,0,1])
		baseText();
  }
}

module textRecess()
{
  difference() {
    text();
    cylinder(h=ringHeight, r1=bottomInnerRadius+ringThickness-recessDepth, r2=topInnerRadius+ringThickness-recessDepth, center=true);
  }
}


//difference() {
//  ring();
//  textRecess();
//}
ring();