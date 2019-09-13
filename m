From: Rohit Sarkar <rohitsarkar5398@gmail.com>
Date: Fri, 13 Sep 2019 17:50:21 +0000
Subject: Problems during compiling in kernel modules
Message-Id: <20190913173821.GA5986@SARKAR>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
I was trying to compile a particular folder in my kernel tree.

AFAIK the way to do this is:
`make drivers/staging/iio/` from the kernel base directory.

This gives me the following output:
`
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND  objtool
`

No object files are generated.
I feel like I am missing something.

Thanks,
Rohit
