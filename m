From: David Howells <dhowells@redhat.com>
Date: Fri, 21 Nov 2008 16:25:07 +0000
Subject: Re: [PATCH] CRED: fix compilation warning in function 'get_cred'
Message-Id: <18016.1227284707@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811210654v45126cbene22d925a1760d9e2@mail.gmail.com> <154e089b0811201400w6b5d249eyc21ebb9a76133d08@mail.gmail.com> <11321.1227219571@redhat.com>
In-Reply-To: <154e089b0811210654v45126cbene22d925a1760d9e2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hannes Eder <hannes@hanneseder.net> wrote:

> What do you suggest, report this as a gcc bug?

You could do.  It might be worth checking to see if it's fixed with a newer
gcc first, though.

David
