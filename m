From: "Paolo Ciarrocchi" <paolo.ciarrocchi@gmail.com>
Date: Sun, 13 Jan 2008 21:50:19 +0000
Subject: Re: Statistics with checkpatch.pl
Message-Id: <4d8e3fd30801131350l7ab54c9ci2bcf2ba5c23d8fe7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4d8e3fd30801131326n263c3b57t32289bcb49303e35@mail.gmail.com>
In-Reply-To: <4d8e3fd30801131326n263c3b57t32289bcb49303e35@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Jan 13, 2008 10:42 PM, Jesper Juhl <jesper.juhl@gmail.com> wrote:
[...]
> Hmm, something along the lines of this should do...
>
> yourscript | grep "total:" | sort --key=2 | tail -n 10
>

Not really:
paolo@paolo-desktop:~/linux-2.6/arch/x86$ cat
/home/paolo/Desktop/checkpatch_output.txt |grep "total:" | sort
--key=2 | tail -n 10
total: 8 errors, 46 warnings, 763 lines checked
total: 8 errors, 4 warnings, 125 lines checked
total: 97 errors, 69 warnings, 2889 lines checked
total: 9 errors, 34 warnings, 423 lines checked
total: 9 errors, 6 warnings, 194 lines checked
total: 9 errors, 6 warnings, 440 lines checked
total: 9 errors, 8 warnings, 175 lines checked
total: 9 errors, 8 warnings, 544 lines checked
total: 9 errors, 9 warnings, 307 lines checked
total: 9 errors, 9 warnings, 422 lines checked

Looks like sort is only looking at the first digit.

Thanks!

Ciao,
-- 
Paolo
http://paolo.ciarrocchi.googlepages.com/
