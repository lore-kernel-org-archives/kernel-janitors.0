From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 03 Jul 2019 10:43:30 +0000
Subject: Re: [PATCH] bpf: Replace a seq_printf() call by seq_puts() in btf_enum_seq_show()
Message-Id: <20190703104330.GA8931@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <93898abe-9a7d-0c64-0856-094b62e07ba2@web.de>
 <e0c9978f-7304-8a25-1bc9-b2be8a038382@iogearbox.net>
In-Reply-To: <e0c9978f-7304-8a25-1bc9-b2be8a038382@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Markus Elfring <Markus.Elfring@web.de>, bpf@vger.kernel.org, netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jul 03, 2019 at 12:09:51PM +0200, Daniel Borkmann wrote:
> On 07/02/2019 07:13 PM, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 2 Jul 2019 19:04:08 +0200
> > 
> > A string which did not contain a data format specification should be put
> > into a sequence. Thus use the corresponding function “seq_puts”.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> The code is fine as is, I'm not applying this.

Just a heads up, this person/bot is in my kill-file, making it easier to
ignore crazy things like this.  I recommend it for other maintainers to
also do as well.

thanks,

greg k-h
