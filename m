From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 16 Dec 2008 13:35:16 +0000
Subject: Re: [PATCH] HID: avoid sparse warning in HID_COMPAT_LOAD_DRIVER
Message-Id: <alpine.LNX.1.10.0812161434150.21089@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4947a48f.08b6660a.34ca.ffffa1e8@mx.google.com>
In-Reply-To: <4947a48f.08b6660a.34ca.ffffa1e8@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 16 Dec 2008, Hannes Eder wrote:

> Impact: include a prototype for the exported function in the macro
> 
> Fix about 20 of this warnings:
> 
>   drivers/hid/hid-a4tech.c:162:1: warning: symbol 'hid_compat_a4tech' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs
