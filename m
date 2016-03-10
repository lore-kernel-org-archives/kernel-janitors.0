From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Mar 2016 19:44:03 +0000
Subject: re: tracing: Make tracer_flags use the right set_flag callback
Message-Id: <20160310194403.GA17979@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Chunyu Hu,

The patch d39cdd2036a6: "tracing: Make tracer_flags use the right
set_flag callback" from Mar 8, 2016, leads to the following
Smatch warning:

kernel/trace/trace.c:1303 register_tracer()
warn: inconsistent returns 'mutex:&trace_types_lock'.
  Locked on:   line 1260
  Unlocked on: line 1232
               line 1237
               line 1303


kernel/trace/trace.c
  1253  
  1254          if (!type->set_flag)
  1255                  type->set_flag = &dummy_set_flag;
  1256          if (!type->flags) {
  1257                  /*allocate a dummy tracer_flags*/
  1258                  type->flags = kmalloc(sizeof(*type->flags), GFP_KERNEL);
  1259                  if (!type->flags)
  1260                          return -ENOMEM;

Should probably be a goto out.

  1261                  type->flags->val = 0;
  1262                  type->flags->opts = dummy_tracer_opt;
  1263          } else
  1264                  if (!type->flags->opts)
  1265                          type->flags->opts = dummy_tracer_opt;
  1266  
  1267          /* store the tracer for __set_tracer_option */
  1268          type->flags->trace = type;
  1269  
  1270          ret = run_tracer_selftest(type);
  1271          if (ret < 0)
  1272                  goto out;
  1273  
  1274          type->next = trace_types;
  1275          trace_types = type;
  1276          add_tracer_options(&global_trace, type);
  1277  
  1278   out:
  1279          tracing_selftest_running = false;
  1280          mutex_unlock(&trace_types_lock);
  1281  
  1282          if (ret || !default_bootup_tracer)
  1283                  goto out_unlock;

It's weird that goto out_unlock doesn't unlock.


  1284  

regards,
dan carpenter
