From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 17 Aug 2012 03:23:34 +0000
Subject: [trace:rfc:multi-buffers-v4 20/26] kernel/trace/trace_events.c:957:22-25: ERROR: reference preceded
Message-Id: <20120817032334.GA26867@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <502956bb.qthNqZPGTcbhybuX%fengguang.wu@intel.com>
In-Reply-To: <502956bb.qthNqZPGTcbhybuX%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Steven,

FYI, there are new coccinelle warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git rfc/multi-buffers-v4
head:   e712fa131ebb7d79ffb4965b6ac5493408662b26
commit: c09e363f27e235a60b0b8b11228779e74e0deee8 [20/26] tracing: Separate out trace events from global variables

All coccinelle warnings:

+ kernel/trace/trace_events.c:957:22-25: ERROR: reference preceded by free on line 955

vim +957 kernel/trace/trace_events.c
   954		if (ret < 0)
   955			kfree(dir);
   956	
 > 957		filp->private_data = dir;
   958	
   959		return ret;
   960	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
