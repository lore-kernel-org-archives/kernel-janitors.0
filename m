From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 21 Feb 2018 16:04:24 +0000
Subject: Re: [PATCH] iio:dummy: Fix coding style in simple_dummy and evgen
Message-Id: <CAEnQRZAhZ=PR+X3=HYRQKkTHUnczWcsv4945piCrwK31PbuXGg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180221140533.lll6vbwg3gyjrlvi@smtp.gmail.com>
In-Reply-To: <20180221140533.lll6vbwg3gyjrlvi@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Daniel Baluta <daniel.baluta@nxp.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 21, 2018 at 4:05 PM, Rodrigo Siqueira
<rodrigosiqueiramelo@gmail.com> wrote:
> This patch fixes the following checkpatch.pl warnings:
>
> drivers/iio/dummy/iio_simple_dummy.c:603: WARNING: Block comments should
> align the * on each line
> drivers/iio/dummy/iio_dummy_evgen.c:151: WARNING: Symbolic permissions
> 'S_IWUSR' are not preferred. Consider using octal permissions '0200'...
> drivers/iio/dummy/iio_simple_dummy.c:693: CHECK: Please use a blank line
> after function/struct/union/enum declarations

You are trying to fix 3 things in one patch here. Please don't do that.

One patch per change please.

thanks,
Daniel.
