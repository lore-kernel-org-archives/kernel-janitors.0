From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Nov 2017 06:08:10 +0000
Subject: [bug report] locking/locktorture: Fix num reader/writer corner cases
Message-Id: <20171113084049.f7zr3fj6xzwjrkl7@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Davidlohr Bueso,

This is a semi-automatic email about new static checker warnings.

The patch 2b8ae38e13f1: "locking/locktorture: Fix num reader/writer 
corner cases" from May 15, 2017, leads to the following Smatch 
complaint:

    kernel/locking/locktorture.c:711 __torture_print_stats()
     error: we previously assumed 'statp' could be null (see line 706)

kernel/locking/locktorture.c
   705		int i, n_stress;
   706		long max = 0, min = statp ? statp[0].n_lock_acquired : 0;
                                    ^^^^^^^
Patch adds a check for NULL.

   707		long long sum = 0;
   708	
   709		n_stress = write ? cxt.nrealwriters_stress : cxt.nrealreaders_stress;
   710		for (i = 0; i < n_stress; i++) {
   711			if (statp[i].n_lock_fail)
                            ^^^^^^^^
Can this be NULL here?

   712				fail = true;
   713			sum += statp[i].n_lock_acquired;

regards,
dan carpenter
