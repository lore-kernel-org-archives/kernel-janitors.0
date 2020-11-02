From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Nov 2020 07:45:24 +0000
Subject: [bug report] tracing, synthetic events: Replace buggy strcat() with seq_buf operations
Message-Id: <20201102074524.GA4040095@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Steven Rostedt (VMware),

The patch 761a8c58db6b: "tracing, synthetic events: Replace buggy
strcat() with seq_buf operations" from Oct 23, 2020, leads to the
following static checker warning:

	kernel/trace/trace_events_synth.c:703 parse_synth_field()
	warn: passing zero to 'ERR_PTR'

kernel/trace/trace_events_synth.c
   582  static struct synth_field *parse_synth_field(int argc, const char **argv,
   583                                               int *consumed)
   584  {
   585          struct synth_field *field;
   586          const char *prefix = NULL, *field_type = argv[0], *field_name, *array;
   587          int len, ret = 0;
   588          struct seq_buf s;
   589          ssize_t size;
   590  
   591          if (field_type[0] = ';')
   592                  field_type++;
   593  
   594          if (!strcmp(field_type, "unsigned")) {
   595                  if (argc < 3) {
   596                          synth_err(SYNTH_ERR_INCOMPLETE_TYPE, errpos(field_type));
   597                          return ERR_PTR(-EINVAL);
   598                  }
   599                  prefix = "unsigned ";
   600                  field_type = argv[1];
   601                  field_name = argv[2];
   602                  *consumed = 3;
   603          } else {
   604                  field_name = argv[1];
   605                  *consumed = 2;
   606          }
   607  
   608          field = kzalloc(sizeof(*field), GFP_KERNEL);
   609          if (!field)
   610                  return ERR_PTR(-ENOMEM);
   611  
   612          len = strlen(field_name);
   613          array = strchr(field_name, '[');
   614          if (array)
   615                  len -= strlen(array);
   616          else if (field_name[len - 1] = ';')
   617                  len--;
   618  
   619          field->name = kmemdup_nul(field_name, len, GFP_KERNEL);
   620          if (!field->name) {
   621                  ret = -ENOMEM;
   622                  goto free;
   623          }
   624          if (!is_good_name(field->name)) {
   625                  synth_err(SYNTH_ERR_BAD_NAME, errpos(field_name));
   626                  ret = -EINVAL;
   627                  goto free;
   628          }
   629  
   630          if (field_type[0] = ';')
   631                  field_type++;
   632          len = strlen(field_type) + 1;
   633  
   634          if (array)
   635                  len += strlen(array);
   636  
   637          if (prefix)
   638                  len += strlen(prefix);
   639  
   640          field->type = kzalloc(len, GFP_KERNEL);
   641          if (!field->type) {
   642                  ret = -ENOMEM;
   643                  goto free;
   644          }
   645          seq_buf_init(&s, field->type, len);
   646          if (prefix)
   647                  seq_buf_puts(&s, prefix);
   648          seq_buf_puts(&s, field_type);
   649          if (array) {
   650                  seq_buf_puts(&s, array);
   651                  if (s.buffer[s.len - 1] = ';')
   652                          s.len--;
   653          }
   654          if (WARN_ON_ONCE(!seq_buf_buffer_left(&s)))
   655                  goto free;

This was originally reported by kbuild-bot, but it was somehow
overlooked so now it's on my system.  The missing error code will lead
to a NULL dereference in the caller.

   656          s.buffer[s.len] = '\0';
   657  
   658          size = synth_field_size(field->type);
   659          if (size < 0) {
   660                  synth_err(SYNTH_ERR_INVALID_TYPE, errpos(field_type));
   661                  ret = -EINVAL;
   662                  goto free;
   663          } else if (size = 0) {
   664                  if (synth_field_is_string(field->type)) {
   665                          char *type;
   666  
   667                          len = sizeof("__data_loc ") + strlen(field->type) + 1;
   668                          type = kzalloc(len, GFP_KERNEL);
   669                          if (!type) {
   670                                  ret = -ENOMEM;
   671                                  goto free;
   672                          }
   673  
   674                          seq_buf_init(&s, type, len);
   675                          seq_buf_puts(&s, "__data_loc ");
   676                          seq_buf_puts(&s, field->type);
   677  
   678                          if (WARN_ON_ONCE(!seq_buf_buffer_left(&s)))
   679                                  goto free;

Here as well.

   680                          s.buffer[s.len] = '\0';
   681  
   682                          kfree(field->type);
   683                          field->type = type;
   684  
   685                          field->is_dynamic = true;
   686                          size = sizeof(u64);
   687                  } else {
   688                          synth_err(SYNTH_ERR_INVALID_TYPE, errpos(field_type));
   689                          ret = -EINVAL;
   690                          goto free;
   691                  }
   692          }
   693          field->size = size;
   694  
   695          if (synth_field_is_string(field->type))
   696                  field->is_string = true;
   697  
   698          field->is_signed = synth_field_signed(field->type);
   699   out:
   700          return field;
   701   free:
   702          free_synth_field(field);
   703          field = ERR_PTR(ret);
   704          goto out;
   705  }

regards,
dan carpenter
