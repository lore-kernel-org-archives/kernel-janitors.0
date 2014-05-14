From: Nicolas Palix <nicolas.palix@imag.fr>
Date: Wed, 14 May 2014 10:40:47 +0000
Subject: Re: patch review tools
Message-Id: <CAAxaTiMhhge9XN=hzMpVEWvRzW8_hNx7QO++91A_azPKL+5+hg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <536EDC5F.1090108@infradead.org>
In-Reply-To: <536EDC5F.1090108@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Sun, May 11, 2014 at 4:11 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> What visual patch review tools are available?
>
> I'd like a simple text-mode tool that applies a patch file to an original
> source file and prints the full merged file, with both 'before' (-) lines
> and 'after' (+) lines included, so that I can easily see the full context
> and all of the changed lines.
>
> Is there already such a tool?

I would say cwdiff or cdiff. Not exactly what you asked for
but this is what I used for this purpose. By increasing the
context size used by diff with the -U option, you should be able to
get the full
context.

>
> thanks,

Regards.

> --
> ~Randy
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Nicolas Palix
Tel: +33 4 76 51 46 27
http://lig-membres.imag.fr/palix/
