From: "Allan, Bruce W" <bruce.w.allan@intel.com>
Date: Fri, 27 Jan 2012 20:29:13 +0000
Subject: boolean result from a test for a bit
Message-Id: <804857E1F29AAC47BF68C404FC60A1842485E4@ORSMSX102.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

For a simple boolean test of whether, for example, bit 5 is set in the variable 'flags', which of the following methods is preferred over the other?

bool result = (flags & (1 << 5)) ? true : false;

or

bool result = !!(flags & (1 << 5));

I've seen examples of both in the Linux kernel.

Thanks,
Bruce.
