From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sat, 17 Mar 2007 00:59:32 +0000
Subject: Re: [KJ] [RFC] A need for "yesno"-function? (and "cleanup" of
Message-Id: <45FB3D74.2040907@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45F95351.60308@student.ltu.se> <39e6f6c70703152036m778ea054gf32723d0eda2be68@mail.gmail.com> <45FAB6C5.8050302@student.ltu.se> <Pine.LNX.4.61.0703170019010.23117@yvahk01.tjqt.qr>
In-Reply-To: <Pine.LNX.4.61.0703170019010.23117@yvahk01.tjqt.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, Kernel Janitors List <kernel-janitors@lists.osdl.org>, linux-kernel@vger.kernel.org

Jan Engelhardt wrote:
> On Mar 16 2007 16:24, Richard Knutsson wrote:
>   
>>>> char yesno_chr(const bool value)
>>>> {
>>>>        return "ny"[value];
>>>> }
>>>>
>>>> char *yesno_str(const bool value)
>>>> {
>>>>        return &"no\0yes"[3 * value];
>>>> }
>>>>         
>
> static/extern const char *const yesno[] = {"no", "yes"};
> static inline const char *yesno_str(bool value)
>   
Should we use "inline"? Isn't it better to leave that to the compiler?
Why the "const"?
> {
> 	return yesno[value];
> }
>   
That's better :)
But I think a simple

static char *yesno_str(bool value)
{
	return value ? "yes" : "no";
}
is to prefer, don't you? It is simpler and we don't need to deal with an unnecessary array (unless it may be used by itself, that is. Then I would go for your implementation).

> #or
> #define yesno_str(value) yesno[!!(value)]
>   
Why not "(bool)value" instead? We cast all the other times we want a 
something to be of a different kind.

Any thoughts where to put a function like this?

Richard Knutsson


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
