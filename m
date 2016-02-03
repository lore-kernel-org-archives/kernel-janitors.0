From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Feb 2016 04:34:08 +0000
Subject: re: rcutorture: Add RCU grace-period performance tests
Message-Id: <20160203043407.GA32754@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Paul E. McKenney,

This is a semi-automatic email about new static checker warnings.

The patch 7f68f317a3d9: "rcutorture: Add RCU grace-period performance 
tests" from Dec 31, 2015, leads to the following Smatch complaint:

kernel/rcu/rcuperf.c:486 rcu_perf_cleanup()
	 error: we previously assumed 'writer_n_durations' could be null (see line 465)

kernel/rcu/rcuperf.c
   442  static void
   443  rcu_perf_cleanup(void)
   444  {
   445          int i;
   446          int j;
   447          int ngps = 0;
   448          u64 *wdp;
   449          u64 *wdpp;
   450  
   451          if (torture_cleanup_begin())
   452                  return;
   453  
   454          if (reader_tasks) {
   455                  for (i = 0; i < nrealreaders; i++)
   456                          torture_stop_kthread(rcu_perf_reader,
   457                                               reader_tasks[i]);
   458                  kfree(reader_tasks);
   459          }
   460  
   461          if (writer_tasks) {
   462                  for (i = 0; i < nrealwriters; i++) {
   463                          torture_stop_kthread(rcu_perf_writer,
   464						     writer_tasks[i]);
   465				if (!writer_n_durations)
                                     ^^^^^^^^^^^^^^^^^^
Can be NULL here.

   466					continue;
   467				j = writer_n_durations[i];
   468				pr_alert("%s%s writer %d gps: %d\n",
   469					 perf_type, PERF_FLAG, i, j);
   470				ngps += j;
   471			}
   472			pr_alert("%s%s start: %llu end: %llu duration: %llu gps: %d batches: %ld\n",
   473				 perf_type, PERF_FLAG,
   474				 t_rcu_perf_writer_started, t_rcu_perf_writer_finished,
   475				 t_rcu_perf_writer_finished -
   476				 t_rcu_perf_writer_started,
   477				 ngps,
   478				 b_rcu_perf_writer_finished -
   479				 b_rcu_perf_writer_started);
   480			for (i = 0; i < nrealwriters; i++) {
   481				if (!writer_durations)
   482					break;
   483				wdpp = writer_durations[i];
   484				if (!wdpp)
   485					continue;
   486				for (j = 0; j <= writer_n_durations[i]; j++) {
                                                 ^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference.

   487					wdp = &wdpp[j];
   488					pr_alert("%s%s %4d writer-duration: %5d %llu\n",

regards,
dan carpenter
