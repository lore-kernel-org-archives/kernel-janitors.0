From: T Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:39:28 +0000
Subject: [PATCH v2 00/21] Staging: cleaned up makefiles cflag lines
Message-Id: <AANLkTiktbML6rHtTHKAmgP9xcZG-Dq362-Yc-_zJn18N@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I changed every makefile in the staging directory to use the proper
ccflags-y option instead of EXTRA_CFLAGS and also changing the first
assignment to ":=" from "+=".


I couldn't change changing the first assignment to ":=" from "+=" for
the following four lines in rtl8192u Makefile r it wouldn't compile.
1.ccflags-y += -DTHOMAS_BEACON -DTHOMAS_TASKLET -DTHOMAS_SKB -DTHOMAS_TURBO
2.ccflags-y += -DUSE_ONE_PIPE
3.ccflags-y += -DENABLE_DOT11D
4.ccflags-y += -Idrivers/staging/rtl8192u/ieee80211



It builds  :) .

Thanks,
Tracey Dent
