require("spec_helper.js");
require("../../public/javascripts/application.js");

Screw.Unit(function(){
  describe("Application", function(){
    describe("on #afterShoutyCreated", function(){
      it("should prepend the passed argument to the .shouties container", function() {
        afterShoutyCreated("<div id='test' />");
        expect($(".shouties *:first").attr('id')).to(equal, 'test');
      });

      it("should empty the #shouty_body value", function() {
        $("#shouty_body").val("ffewfe");
        afterShoutyCreated("<div />");
        expect($("#shouty_body").val()).to(equal, '');
      });
    });
  });

  describe("on #updateShoutiesFrom", function() {
    it("should replace .shouties content with the param", function() {
      var html = "<div id=\"new\"/>"
      updateShoutiesFrom(html);
      expect($(".shouties").html()).to(equal, html);
    });
  });
});
