From: "Hannes Eder" <hannes@hanneseder.net>
Date: Fri, 21 Nov 2008 14:54:08 +0000
Subject: Re: [PATCH] CRED: fix compilation warning in function 'get_cred'
Message-Id: <154e089b0811210654v45126cbene22d925a1760d9e2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811201400w6b5d249eyc21ebb9a76133d08@mail.gmail.com>
	 <11321.1227219571@redhat.com>
In-Reply-To: <11321.1227219571@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 20, 2008 at 11:19 PM, David Howells <dhowells@redhat.com> wrote:
> Hannes Eder <hannes@hanneseder.net> wrote:
>
>> Fix to following warning by introducing a temporary variable:
>>
>> include/linux/cred.h: In function 'get_cred':
>> include/linux/cred.h:187: warning: passing argument 1 of
>> 'get_new_cred' discards qualifiers from pointer target type
>
> Interesting.  I believe that's a compiler bug.  Explicitly casting away the
> const should avoid this warning.

Strange. I think you are right, looks like a compiler bug.  I am using
gcc (GCC) 4.2.4 (Ubuntu 4.2.4-1ubuntu3).  Compiling the following code
snippet does not yield a spurious warning:

struct foo {
	int a;
};

static inline struct foo *bar(struct foo *foo)
{
	foo->a++;
	return foo;
}

static inline const struct foo *bar2(const struct foo *foo)
{
	return bar((struct foo*)foo);
}

What do you suggest, report this as a gcc bug?

-Hannes
