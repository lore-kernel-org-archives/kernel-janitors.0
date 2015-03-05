From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 05 Mar 2015 10:56:51 +0000
Subject: Re: [PATCH 1/1] staging: io: Remove unnecessary OOM message
Message-Id: <alpine.DEB.2.10.1503050556210.2601@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150305102316.GA4389@sloth> <alpine.DEB.2.10.1503050528080.2601@hadrien> <54F835E3.9080407@gmail.com>
In-Reply-To: <54F835E3.9080407@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Thu, 5 Mar 2015, Quentin Lambert wrote:

>
>
> On 05/03/2015 11:28, Julia Lawall wrote:
> > It's i2o, not io, and it is on the way out of the kernel.
> sorry about that,
> since it is on its way out I guess there is no need for me to submit a correct
> version of this patch?
>
> Are there resources to know whether or not a driver will be dropped or is it
> enough to check if there is
> a TODO file in its directory?

These are the staging drivers that I know of:

i2o
line6
media/parport
media/tlg2300
media/vino

julia
