From: "Hugo Vasconcelos Saldanha" <hugovs@gmail.com>
Date: Wed, 30 Jul 2008 12:40:07 +0000
Subject: Re: How to fix warning 'control reaches end of non-void function'
Message-Id: <276ad7a30807300540n5fdeb07cmec8ba45cedb7a753@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080729191738.GA32506@orion>
In-Reply-To: <20080729191738.GA32506@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 29, 2008 at 8:27 PM, Alexander Beregalov
<a.beregalov@gmail.com> wrote:
>
> Looks good, but how can I know which value should it return in that case?
>

I think you should specify an error code to return, letting the caller
decide what to do with it.

--
Hugo
