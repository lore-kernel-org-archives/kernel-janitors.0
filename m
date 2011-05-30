From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Mon, 30 May 2011 21:23:40 +0000
Subject: Janitor-Question: use __set_bit instead of |=
Message-Id: <201105302323.43979.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Janitors, staging-list

what is your opinion on using set_bit instead of using |= to set a bit?
Is it worth the effort to convert  existing |= to set_bit?

__set_bit
pro:
- often implemented in optimized assembly (e.g. for x86)
- intention might be clearer
- less error prone
- "they are the only portable way to set a specific bit"
according to  Robert Love's Linux Kernel Development third edition, p.183

cons:
uses unsigned longs


|pro:
- standard C
- let's the compiler decide
- no warnings on chars, shorts, ints


Thanks,
Peter



