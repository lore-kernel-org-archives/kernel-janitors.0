From: "Hannes Eder" <hannes@hanneseder.net>
Date: Tue, 25 Nov 2008 00:46:10 +0000
Subject: Re: [PATCH] CRED: fix sparse warnings
Message-Id: <154e089b0811241646y6ada2c97l5e45284969729e29@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811241314t3291ea30w6268bb5b2b5c7c53@mail.gmail.com>
	 <5008.1227568869@redhat.com>
In-Reply-To: <5008.1227568869@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 25, 2008 at 12:21 AM, David Howells <dhowells@redhat.com> wrote:
> Hannes Eder <hannes@hanneseder.net> wrote:
>
>>   security/security.c:228:2: warning: returning void-valued expression
>>   security/security.c:233:2: warning: returning void-valued expression
>>   security/security.c:616:2: warning: returning void-valued expression
>
> What's wrong with that?

In my opinion the following quotes give good argument:

> On Thu, 2008-05-01 at 13:00 +0100, Al Viro wrote:
[snip|
> > 3.  6.8.6.4(1): A return statement with an expression shall not appear in
> > a function whose return type is void.
> >
> > Write in C, please.

see http://lkml.org/lkml/2008/5/1/88

On Thu, 1 May 2008 at 13:53:39 +0100, Al Viro wrote:
> On Thu, May 01, 2008 at 03:42:14PM +0300, Boaz Harrosh wrote:
> > > 3.  6.8.6.4(1): A return statement with an expression shall not appear in
> > > a function whose return type is void.
> > >
> >
> > Please forgive my ignorance, where is this quote from?
>
> C99.  I don't have C90 in front of me, so I can't give you exact quote from
> there, but it's been explicitly banned in C90 as well.

see http://lkml.org/lkml/2008/5/1/112

There have been a couple of such patches, see

http://www.google.at/search?q=site:lkml.org+%22warning:+returning+void-valued+expression%22

Furthermore in the next-tree from today and 'defconfig' are only 5 of
such warnings left, 3 of them would be resolved with this patch.

Hannes
