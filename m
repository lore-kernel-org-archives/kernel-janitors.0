From: "Bert Wesarg" <bert.wesarg@googlemail.com>
Date: Sun, 27 Jan 2008 23:29:08 +0000
Subject: Re: #if 0
Message-Id: <36ca99e90801271529m38d21716j4ee5ba8a35c0671b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4d8e3fd30801271510kff526e1u98a7f85e3606b8e3@mail.gmail.com>
In-Reply-To: <4d8e3fd30801271510kff526e1u98a7f85e3606b8e3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Jan 28, 2008 12:10 AM, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com> wrote:
> Hi all,
> I'm failing to understand why the following patch is changing the md5sum
> of the relative .o file
>
> Isn't the code included in the #if 0 #endif section supposed to be
> ignored by the compiler?
Yes, but I think the line numbers changes too and are also in the .o file.

Bert
>
> I'm compiling as follow:
> make clean && make arch/x86/math-emu/errors.o
> before and after the patch.
> And comparing the md5sum of the two .o files using the md5sum command.
>
> Thanks!
>
> Ciao,
> --
> Paolo
