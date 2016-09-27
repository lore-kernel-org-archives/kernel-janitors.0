From: Tilman Schmidt <tilman@imap.cc>
Date: Tue, 27 Sep 2016 10:57:31 +0000
Subject: Re: [PATCH 3/5] ISDN-Gigaset: Delete an error message for a failed memory allocation
Message-Id: <1474973851.1608488.738293513.6CA62927@webmail.messagingengine.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
 <64f7ba12-1b0e-9fac-9b2e-d22e7fb3fcc7@users.sourceforge.net>
In-Reply-To: <64f7ba12-1b0e-9fac-9b2e-d22e7fb3fcc7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, Paul Bolle <pebolle@tiscali.nl>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>

On Mon, Sep 26, 2016, at 17:42, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 26 Sep 2016 15:35:47 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> Link:
> http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

The patch is fine but the link in the commit message is irrelevant.
Please remove it.
(Yes, I read through the whole presentation to verify that. It was fun,
even.)

-- 
Tilman Schmidt
tilman@imap.cc
