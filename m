From: Jarno Rajahalme <jarno@ovn.org>
Date: Mon, 02 May 2016 20:41:35 +0000
Subject: Re: [PATCH net 2/3] udp_offload: Set encapsulation before inner completes.
Message-Id: <44C57D21-2DE3-4E7B-839F-AD875248FF06@ovn.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461964650-4779-2-git-send-email-jarno@ovn.org>
In-Reply-To: <1461964650-4779-2-git-send-email-jarno@ovn.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> On Apr 30, 2016, at 12:32 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> These patches look reasonable.  But can you update the changelogs for 2
> and 3 to say the user visible effects of these bugs.
> 
> Resend it to the people from ./scripts/get_maintainer.pl -f net/ipv4/udp_offload.c
> 
> regards,
> dan carpenter
> 

Thanks, I send a v2 with a better commit message to the email addresses returned by the get_maintainer script.

   Jarno

