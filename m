From: Johannes Weiner <hannes@saeurebad.de>
Date: Tue, 29 Jul 2008 20:51:03 +0000
Subject: Re: How to fix warning 'control reaches end of non-void function'
Message-Id: <87fxpsct3c.fsf@saeurebad.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080729191738.GA32506@orion>
In-Reply-To: <20080729191738.GA32506@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Alexander Beregalov <a.beregalov@gmail.com> writes:

> Hi
>
> What is it a right way to fix these warnings?
>
> smth function()
> {
> 	switch (var) {
> 	case one:
> 		return 1;
> 	default:
> 		BUG();
> 	}
> }
>
> warning: control reaches end of non-void function

Uhm, make sure there is always a value returned...?  You don't do that
when var is not one.

	Hannes
