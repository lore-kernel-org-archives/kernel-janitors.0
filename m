From: David Howells <dhowells@redhat.com>
Date: Thu, 20 Nov 2008 22:19:31 +0000
Subject: Re: [PATCH] CRED: fix compilation warning in function 'get_cred'
Message-Id: <11321.1227219571@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811201400w6b5d249eyc21ebb9a76133d08@mail.gmail.com>
In-Reply-To: <154e089b0811201400w6b5d249eyc21ebb9a76133d08@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hannes Eder <hannes@hanneseder.net> wrote:

> Fix to following warning by introducing a temporary variable:
> 
> include/linux/cred.h: In function 'get_cred':
> include/linux/cred.h:187: warning: passing argument 1 of
> 'get_new_cred' discards qualifiers from pointer target type

Interesting.  I believe that's a compiler bug.  Explicitly casting away the
const should avoid this warning.

David
