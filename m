From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 23 Nov 2010 00:20:48 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <1290471649.2704.24.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com>
	 <20101112120834.33062900.akpm@linux-foundation.org>
	 <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca>
	 <20101114092533.GB5323@albatros>
	 <20101114180643.593d19ac.akpm@linux-foundation.org>
	 <1289848341.2607.125.camel@edumazet-laptop> <4CE268C8.5010203@panasas.com>
	 <20101122155043.fbbb74f4.akpm@linux-foundation.org>
In-Reply-To: <20101122155043.fbbb74f4.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Boaz Harrosh <bharrosh@panasas.com>, Vasiliy Kulikov <segoon@openwall.com>, Andreas Dilger <adilger.kernel@dilger.ca>, kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>

Le lundi 22 novembre 2010 à 15:50 -0800, Andrew Morton a écrit :

> Well.  We certainly assume in many places that
> 
> 	struct foo {
> 		int a;
> 		int b;
> 	} f = {
> 		.a = 1,
> 	};
> 
> will initialise b to zero.  But I doubt if much code at all assumes
> that this initialisation patterm will reliably zero out *holes* in the
> struct.
> 

We did such assertions in the past, we were wrong.

Check commit 1c40be12f7d8ca1d387510d39787b12e512a7ce8 for an example
(net sched: fix some kernel memory leaks)

I guess we must make a full audit of all C99 initializers or structures
copied to userspace, giving a name to hidden holes, to force gcc to init
them to 0.

# cat try.c
struct s {
	char c;
	long l;
	};

void bar(void *v)
{
	unsigned long *p = v;

	printf("%lx %lx\n", p[0], p[1]);
}

int main()
{
	struct s s1 = {
		.c = 1,
		.l = 2,
	};

	bar(&s1);
	return 0;
}

# gcc -O2 -o try try.c
# ./try
8049401 2

Strangely, if we remove ".l = 2," line, gcc emits code to clear al the
fields

main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	leal	24(%esp), %eax
	movl	$0, 24(%esp)
	movl	%eax, (%esp)
	movl	$0, 28(%esp)
	movb	$1, 24(%esp)
	call	bar
	xorl	%eax, %eax
	leave
	ret


