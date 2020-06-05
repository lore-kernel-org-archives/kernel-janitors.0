From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 05 Jun 2020 13:26:39 +0000
Subject: Re: [PATCH] KVM: selftests: delete some dead code
Message-Id: <891e89c8-8467-eeb4-1b23-337b88a299dd@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200605110048.GB978434@mwanda>
 <9f20e25d-599d-c203-e3d4-905b122ef5a3@redhat.com>
 <20200605115316.z5tavmf5rjobypve@kamzik.brq.redhat.com>
 <20200605124816.GB55548@xz-x1>
In-Reply-To: <20200605124816.GB55548@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Xu <peterx@redhat.com>, Andrew Jones <drjones@redhat.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Ben Gardon <bgardon@google.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/06/20 14:48, Peter Xu wrote:
>>> The bug is that strtoul is "impossible" to use correctly.
> Could I ask why?

To see see how annoying the situation is, check out utils/cutils.c in
QEMU; basically, it is very hard to do error handling.  From the man page:

       Since  strtoul() can legitimately return 0 or ULONG_MAX
       (ULLONG_MAX for strtoull()) on both success and failure, the
       calling program should set errno to 0 before the call, and then
       determine if an error occurred by checking whether errno has
       a nonzero value after the call.

and of course no one wants to write code for that every time they have
to parse a number.

In addition, if the string is empty it returns 0, and of endptr is NULL
it will accept something like "123abc" and return 123.

So it is not literally impossible, but it is a poorly-designed interface
which is a major source of bugs.  On Rusty's API design levels[1][2], I
would put it at 3 if I'm feeling generous ("Read the documentation and
you'll get it right"), and at -4 to -7 ("The obvious use is wrong") if
it's been a bad day.

Therefore it's quite common to have a wrapper like

    int my_strtoul(char *p, char **endptr, unsigned long *result);

The wrapper will:

- check that the string is not empty

- always return 0 or -1 because of the by-reference output argument "result"

- take care of checking that the entire input string was parsed, for
example by rejecting partial parsing of the string if endptr = NULL.

This version gets a solid 7 ("The obvious use is probably the correct
one"); possibly even 8 ("The compiler will warn if you get it wrong")
because the output argument gives you better protection against overflow.

Regarding overflow, there is a strtol but not a strtoi, so you need to
have a temporary long and do range checking manually.  Again, you will
most likely make mistakes if you use strtol, while my_strtol will merely
make it annoying but it should be obvious that you're getting it wrong.

Paolo

[1] https://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html
[2] https://ozlabs.org/~rusty/index.cgi/tech/2008-04-01.html
