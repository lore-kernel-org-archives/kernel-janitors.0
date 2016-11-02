From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 02 Nov 2016 18:26:56 +0000
Subject: Re: scripts/basic/bin2c: Complete error handling in main()
Message-Id: <CAK7LNASJiV0T-ruC6mLMzaHKzUDo2rFp0h1H1dQXjGk+wUzc5Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
 <CAK7LNATU4VrN6wCo8vzETMJu6aX+SK+0un03ryzCg7-BW_LxqA@mail.gmail.com> <0fcf5fb3-ff4a-a003-7814-51a6ab5ad988@users.sourceforge.net>
In-Reply-To: <0fcf5fb3-ff4a-a003-7814-51a6ab5ad988@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

2016-11-03 2:48 GMT+09:00 SF Markus Elfring <elfring@users.sourceforge.net>:
>> Is replacing printf("\"\n") with puts("\"") optimization?
>
> Is the difference relevant if an “ordinary” string is passed instead of
> a format string?

I think GCC does the replacement automatically
unless -ffreestanding option is given.


With a quick test, I got the following disassembly

0000000000400440 <main>:
  400440: 48 83 ec 08           sub    $0x8,%rsp
  400444: bf c4 05 40 00       mov    $0x4005c4,%edi
  400449: e8 c2 ff ff ff       callq  400410 <puts@plt>
  40044e: 31 c0                 xor    %eax,%eax
  400450: 48 83 c4 08           add    $0x8,%rsp
  400454: c3                   retq

from the following program:

int main(void)
{
    printf("hello, world\n");
    return 0;
}




>
>> Frankly, the result of this patch seems extremely unreadable code.
>
> Do you care for more complete error detection and corresponding exception handling
> in this source file?


I like the code as is.

Such error checks and magic numbers are messy.



-- 
Best Regards
Masahiro Yamada
