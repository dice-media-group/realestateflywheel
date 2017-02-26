// $(document).ready(function() {
//
//     $("#contacts a.add_fields").
//       data("association-insertion-position", 'before').
//       data("association-insertion-node", 'this');
//
//     $('#contacts').bind('cocoon:after-insert',
//          function(e, contact) {
//              console.log('inserting new contact ...');
//              $(".roster-contact-fields a.add-contact").
//                  data("association-insertion-position", 'after').
//                  data("association-insertion-node", 'this');
//              $(this).find('.roster-contact-fields').bind('cocoon:after-insert',
//                   function() {
//                     console.log('insert new contact ...');
//                     console.log($(this));
//                     $(this).find(".contact_from_list").remove();
//                     $(this).find("a.add_fields").hide();
//                   });
//          });
//
//     $('.roster-contact-fields').bind('cocoon:after-insert',
//         function(e) {
//             console.log('replace OLD contact ...');
//             e.stopPropagation();
//             console.log($(this));
//             $(this).find(".contact_from_list").remove();
//             $(this).find("a.add_fields").hide();
//         });
//
//
//
//     //$('body').tabs();
// });

jQuery(function() {
  return $('.chosen-select').chosen();
});
