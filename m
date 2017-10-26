From: Jonathan Cameron <jic23@kernel.org>
Date: Thu, 26 Oct 2017 16:44:23 +0000
Subject: Re: iio/pressure/hp206c: Use common error handling code in hp206c_conv_and_read()
Message-Id: <20171026174423.210579a6@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bbe04556-c62c-6074-d663-884a702614f4@users.sourceforge.net>
        <20171026172345.5a88cd73@archlinux>
        <93642327-2a41-95ca-dd15-3d040fafe845@users.sourceforge.net>
In-Reply-To: <93642327-2a41-95ca-dd15-3d040fafe845@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-iio@vger.kernel.org, Crestez Dan Leonard <leonard.crestez@intel.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, 26 Oct 2017 18:38:14 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> > The advantages of this are very limited.  
> 
> Would anybody like to check corresponding effects in more detail?
No readabilty is reduced.  It is a very rare patch that is accepted
where that is the case and the reasons have to be extremely clear
and justified.
> 
> 
> > Hence I am not going to apply it.  
> 
> This is a pity that you like such a kind of source code adjustment
> not so much so far.
> 


