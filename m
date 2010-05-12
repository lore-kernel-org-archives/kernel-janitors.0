From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>
Date: Wed, 12 May 2010 04:30:38 +0000
Subject: Re: [PATCH 1/3 v2] kbuild/makefiles.txt: Fix examples and content
Message-Id: <20100512043038.GB5358@cr0.nay.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273603385-20587-1-git-send-email-mfm@muteddisk.com>
In-Reply-To: <1273603385-20587-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfm@muteddisk.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, mec@shout.net, kai@tp1.ruhr-uni-bochum.de, sam@ravnborg.org, jengelh@gmx.de

On Tue, May 11, 2010 at 11:43:05AM -0700, matt mooney wrote:
>
>Update section 3.3 Loadable module goals - obj-m, from $(<module_name>-objs) to $(<module_name>-y) for easier addition of conditional objects to the module. The examples are also updated to reflect the current state of each Makefile used.
>
>Signed-off-by: matt mooney <mfm@muteddisk.com>


The whole patchset looks good to me, so,

Reviewed-by: WANG Cong <xiyou.wangcong@gmail.com>

But note that I am not a native English-speaker, let's
see what Randy will say.

Thanks.
