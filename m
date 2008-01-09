From: Andi Kleen <andi@firstfloor.org>
Date: Wed, 09 Jan 2008 00:03:58 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl II
Message-Id: <20080109000358.GF2117@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com> <20080108204214.GA2117@one.firstfloor.org> <20080108230636.GC2117@one.firstfloor.org> <4d8e3fd30801081543l57add8bei48052bdf68730474@mail.gmail.com>
In-Reply-To: <4d8e3fd30801081543l57add8bei48052bdf68730474@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

> paolo@paolo-desktop:~/linux-2.6/mm$ grep "struct file_operations" *
> shmem.c:static const struct file_operations shmem_file_operations;
> shmem.c:static const struct file_operations shmem_file_operations = {
> swapfile.c:static const struct file_operations proc_swaps_operations = {
> 
> Am I right in saying that both the files don't need to be modified?

If they don't have an ioctl handler they don't need to be modified, correct.

> 
> There is nothing like:
> struct file_operations xyz_ops = {
>        ...
>        .ioctl = xyz_ioctl
> };
> 
> in there.
> 
> So I guess I need a smarter trick to find out which files need to be modified
> as you previously suggested.

grep -P '\.ioctl.*=' $(grep -rl 'struct file_operations' * )

should work. There are also special multiline greps iirc that might also be able
to do this better (like sgrep)

-Andi
