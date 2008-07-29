From: "Daniel Baluta" <daniel.baluta@gmail.com>
Date: Tue, 29 Jul 2008 20:48:26 +0000
Subject: Re: How to fix warning 'control reaches end of non-void function'
Message-Id: <413a6a950807291348y7b4113b0n872e55f30c75084d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080729191738.GA32506@orion>
In-Reply-To: <20080729191738.GA32506@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello ,

You can add a return statement at the end , even if control never reaches there.
It is interesting to know what is the standard way of avoiding this warning?

Daniel.

On Tue, Jul 29, 2008 at 10:17 PM, Alexander Beregalov
<a.beregalov@gmail.com> wrote:
> Hi
>
> What is it a right way to fix these warnings?
>
> smth function()
> {
>        switch (var) {
>        case one:
>                return 1;
>        default:
>                BUG();
>        }
> }
>
> warning: control reaches end of non-void function
>
> Thanks!
>
>
> --
> To unsubscribe from this list: send an email with
> "unsubscribe kernelnewbies" to ecartis@nl.linux.org
> Please read the FAQ at http://kernelnewbies.org/FAQ
>
>
