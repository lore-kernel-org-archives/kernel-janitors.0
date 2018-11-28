From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Nov 2018 14:39:22 +0000
Subject: [bug report] samples: bpf: fix: error handling regarding kprobe_events
Message-Id: <20181128143922.uinv34f3s7cs3kgy@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Daniel T. Lee,

This is a semi-automatic email about new static checker warnings.

The patch 5a863813216c: "samples: bpf: fix: error handling regarding 
kprobe_events" from Nov 23, 2018, leads to the following Smatch 
complaint:

    ./samples/bpf/bpf_load.c:68 write_kprobe_events()
     error: we previously assumed 'val' could be null (see line 61)

./samples/bpf/bpf_load.c
    60	
    61		if ((val != NULL) && (val[0] = '\0'))
                     ^^^^^^^^^^^
If val is NULL

    62			flags = O_WRONLY | O_TRUNC;
    63		else
    64			flags = O_WRONLY | O_APPEND;
    65	
    66		fd = open("/sys/kernel/debug/tracing/kprobe_events", flags);
    67	
    68		ret = write(fd, val, strlen(val));
                                     ^^^^^^^^^^^
then we are toasted because strlen() dereferences it.

    69		close(fd);
    70	

regards,
dan carpenter
