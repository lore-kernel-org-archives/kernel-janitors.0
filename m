From: Jan Kasprzak <kas@fi.muni.cz>
Date: Wed, 22 Sep 2004 21:33:58 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 5/38] net/cosa: replace
Message-Id: <20040922213358.GB11889@fi.muni.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51719005079929525=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51719005079929525==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Nishanth Aravamudan wrote:
: Any comments would be appreciated. Two patches have been removed from my
: set, so the total has been reduced to 38.
: 
: Description: Use msleep_interruptible() instead of schedule_timeout()
: to guarantee the task delays as expected. Also use set_current_state()
: instaed of direct assignment of current->state.
: 
	I am ok with this. Please apply.

-Y.

-- 
| Jan "Yenya" Kasprzak  <kas at {fi.muni.cz - work | yenya.net - private}> |
| GPG: ID 1024/D3498839      Fingerprint 0D99A7FB206605D7 8B35FCDE05B18A5E |
| http://www.fi.muni.cz/~kas/   Czech Linux Homepage: http://www.linux.cz/ |
btw, David, I'm wondering about this loop: [...]  Is this
a busy-wait-until-someone-plugs-in-more-ram-chips thing? ;)  --Andrew Morton

--===============51719005079929525==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51719005079929525==--
