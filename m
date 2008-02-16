From: "Nish Aravamudan" <nish.aravamudan@gmail.com>
Date: Sat, 16 Feb 2008 19:04:20 +0000
Subject: Re: [PATCH] ARRAY_SIZE in linux-2.6.25-rc2/scripts/mod/modpost.c
Message-Id: <29495f1d0802161104o26eda00ar6cfb0b7be0b6f9cd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47B729C0.5060602@googlemail.com>
In-Reply-To: <47B729C0.5060602@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/16/08, Mark Pearson <devnull.port@googlemail.com> wrote:
> Hi
>
> I was looking through the TODO list at kernel janitors and thought I
> would see if there was any clean-up work I could do. I found a message
> about replacing sizeof code for array structures with the ARRAY_SIZE
> macro. If this is useful, I can go through the list of modules I found
> to require this patch.
>
> As this is the first time I'm delivering a patch, could someone comment
> if the format, etc. is ok? If so I will continue with the other modules.
> BTW: I'm check on the mailing archives to ensure I'm not repeating work
> already completed by someone else.

Missing Signed-off-by and a real commit message.

> --- linux-2.6.25-rc2-mpe/scripts/mod/modpost.c  2008-02-16
> 19:06:58.000000000 +0100
> +++ linux-2.6.25-rc2/scripts/mod/modpost.c      2008-02-15
> 21:57:20.000000000 +0100

Patch is word-wrapped.

> @@ -882,7 +882,7 @@
>  static int section_mismatch(const char *fromsec, const char *tosec)
>  {
>         int i;
> -       int elems = ARRAY_SIZE(sectioncheck);
> +       int elems = sizeof(sectioncheck) / sizeof(struct sectioncheck);

And looks to be reversed (want to be adding ARRAY_SIZE(), not removing it).

Thanks,
Nish
