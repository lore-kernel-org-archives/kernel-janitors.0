From: Joe Perches <joe@perches.com>
Date: Sat, 12 Dec 2020 09:16:39 +0000
Subject: Re: mmc: atmel-mci: Reduce scope for the variable =?UTF-8?Q?=E2=80=9Cslot=E2=80=9D?= in atmci_reques
Message-Id: <031a64e4261e1543a136d737436abefd63dbaee1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <466b4c6d-032f-fbcc-58ac-75f6f39d734f@web.de>
 <20201210151035.GC1578121@piout.net>
 <ec71d7b8-a36b-04f5-77a8-22874ac241e1@web.de>
 <20201210170723.GD1578121@piout.net>
 <2667790c-fad2-aaa9-36e8-6be66949ac8d@web.de>
 <20201210182150.GE1578121@piout.net>
 <4c0d8efe-de25-f168-8b8d-b7f1ede6c6b1@web.de>
 <20201211080301.GC1781038@piout.net>
In-Reply-To: <20201211080301.GC1781038@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Markus Elfring <Markus.Elfring@web.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Dan Carpenter <dan.carpenter@oracle.com>, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

On Fri, 2020-12-11 at 09:03 +0100, Alexandre Belloni wrote:
> On 11/12/2020 07:34:41+0100, Markus Elfring wrote:
> > > > How do you think about a patch like “staging: speakup: remove redundant initialization
> > > > of pointer p_key” for comparison?
> > > > https://lore.kernel.org/patchwork/patch/1199128/
> > > > https://lore.kernel.org/driverdev-devel/20200223153954.420731-1-colin.king@canonical.com/
> > > > 
> > > > Would you tolerate to omit the initialisation for the variable “slot”?
> > > 
> > > If you were able to provide one good technical reason.
> > 
> > I find that the positions of variable definitions (and similar assignments) influence
> > the generation of executable code.
> > 
> And you are wrong, it doesn't.

I rarely reply or read any Markus' emails as everything
from Markus goes into a 'don't read' folder but I was cc'd
directly on one from someone else recently so I think I
should reply to this one too.

In this case Alexandre it seems true, but in the generic case
it may be false.  It may depend on stack size and location.

For instance, with large structs declared either at the top
of a function or in separate branches within the function:

$ cat t_structs.c
struct a {
	int a[2000];
	int b[4000];
};

struct b {
	char a[100];
	char b[10000];
};

void foo1(struct a *a);
void foo2(struct b *b);

void foo(int index)
{
	if (index) {
		struct a ai = {};

		ai.a[index] = index;
		foo1(&ai);
	} else {
		struct b bi = {};

		bi.b[0] = 1;
		foo2(&bi);
	}
}

void bar(int index)
{
	struct a ai = {};
	struct b bi = {};

	if (index) {
		ai.a[index] = index;
		foo1(&ai);
	} else {
		bi.b[0] = 1;
		foo2(&bi);
	}
}

$

newer gcc versions are smart enough to minimize
stack use in foo() but not bar() so ai and bi start
at the same address in foo() so the total stack
used is smaller.

older gcc versions like 4.8 use separate addresses
for ai and bi in foo() so the total stack used is
larger.

$ gcc-4.8 -Wframe-larger-than00 -c t_structs.c
t_structs.c: In function ‘foo’:
t_structs.c:27:1: warning: the frame size of 34116 bytes is larger than 1000 bytes [-Wframe-larger-than=]
 }
 ^
t_structs.c: In function ‘bar’:
t_structs.c:41:1: warning: the frame size of 34116 bytes is larger than 1000 bytes [-Wframe-larger-than=]
 }
 ^

$ gcc-5 -Wframe-larger-than00 -c t_structs.c
t_structs.c: In function ‘foo’:
t_structs.c:27:1: warning: the frame size of 24032 bytes is larger than 1000 bytes [-Wframe-larger-than=]
 }
 ^
t_structs.c: In function ‘bar’:
t_structs.c:41:1: warning: the frame size of 34144 bytes is larger than 1000 bytes [-Wframe-larger-than=]
 }
 ^
