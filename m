From: "Arnaldo Carvalho de Melo" <acme@ghostprotocols.net>
Date: Fri, 16 Mar 2007 03:36:10 +0000
Subject: Re: [KJ] [RFC] A need for a "yesno"-function?
Message-Id: <39e6f6c70703152036m778ea054gf32723d0eda2be68@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45F95351.60308@student.ltu.se>
In-Reply-To: <45F95351.60308@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 3/15/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:
> Hi
>
> Was just checking up the 'sparse' when I saw something like "abc"[value]
> and thought: what about the (statement) ? "yes" : "no" I have seen in
> the kernel.
>
> Ran:
> grep -Enr "\?.*y.*\:.*n" *
> and to my surprise, it was not so false-positive-prone and there are
> many who does it. (Piping it to "grep yes" resulted in 153 hits) So I
> thought, if we could standardize this and eliminate some jmp-commands
> while doing it (the compiler should make the functions below inline), it
> might be interesting.
>
> char yesno_chr(const bool value)
> {
>         return "ny"[value];
> }
>
> char *yesno_str(const bool value)
> {
>         return &"no\0yes"[3 * value];
> }
>
>
> (there may be better names for them)
> I believe this should be slightly faster. I wrote two programs (one for
> each approach) and used 'time' while running them, and in a loop of
> 1000,000 I found the above to be slightly faster, but the variations
> between runs were larger.
> So maybe it is as well to write: return value ? "yes" : "no"; but i
> think there is a need for this kind of functions at least.
>
> Thoughts?

The function makes sense, how you implement it? Something simple as
this is hardly on a fast path 8)

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
