From: "Hannes Eder" <hannes@hanneseder.net>
Date: Fri, 21 Nov 2008 20:22:25 +0000
Subject: Re: [PATCH] CRED: fix compilation warning in function 'get_cred'
Message-Id: <154e089b0811211222x5340b78cx496edb25abd1147f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811201400w6b5d249eyc21ebb9a76133d08@mail.gmail.com>
	 <11321.1227219571@redhat.com>
	 <154e089b0811210654v45126cbene22d925a1760d9e2@mail.gmail.com>
	 <18016.1227284707@redhat.com>
In-Reply-To: <18016.1227284707@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 21, 2008 at 5:25 PM, David Howells <dhowells@redhat.com> wrote:
> Hannes Eder <hannes@hanneseder.net> wrote:
>
>> What do you suggest, report this as a gcc bug?
>
> You could do.  It might be worth checking to see if it's fixed with a newer
> gcc first, though.

The spurious warning is gone with gcc (Ubuntu 4.3.2-1ubuntu11) 4.3.2.

Hannes
