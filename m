From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 16 Nov 2010 13:14:50 +0000
Subject: Re: [PATCH 1/3 v2] backlight: constify backlight_ops
Message-Id: <alpine.LNX.2.00.1011161414230.7420@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <902792.32985.qm@smtp148.mail.ukl.yahoo.com>
In-Reply-To: <902792.32985.qm@smtp148.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lionel Debroux <lionel_debroux@yahoo.fr>
Cc: kernel-janitors@vger.kernel.org, Kees Cook <kees.cook@canonical.com>, Emese Revfy <re.emese@gmail.com>, linux-kernel@vger.kernel.org

On Tue, 9 Nov 2010, Lionel Debroux wrote:

> Patch against mainline.
> 
> One non-const struct instance constified by this patch was added after the
> the introduction of backlight_ops in checkpatch.pl's list of "should be const"
> structs (79404849e90a41ea2109bd0e2f7c7164b0c4ce73).

Added Ingo's Ack, and applied the whole series. Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
