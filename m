From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 20 Apr 2004 03:00:25 +0000
Subject: Re: [Kernel-janitors] cvs
Message-Id: <20040419200025.47caf328.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36722482977022053=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0404192024020.30414@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0404192024020.30414@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============36722482977022053==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Apr 2004 19:54:21 -0700 "Randy.Dunlap" <rddunlap@osdl.org> wrote:

| On Mon, 19 Apr 2004 20:25:14 -0600 (MDT) MJK <mkemp@cs.nmsu.edu> wrote:
| 
| | 	I've followed the directions on the homepage but it doesn't work.
| | Is there something wrong with me or cvs?
| 
| 
| I have problems with it also.  Error messages that I see are below.
| Are yours the same?
| 
| Logging in to :pserver:cvs@nl.linux.org:2401/home/CVS
| CVS password:
| cvs [login aborted]: connect to nl.linux.org(131.211.141.196):2401 failed: Connection refused
| cvs [checkout aborted]: connect to nl.linux.org(131.211.141.196):2401 failed: Connection refused
| 
| 
| 
| FYI, this server (same as kernelnewbies.org) was "compromised"
| a couple of months ago and may not be back completely yet.
| I'll keep trying other combinations to see if anything
| works for me, and if so, let you know.

I have an account on nl.linux.org and still cannot check out
files from CVS.  :(
I'll check on it, but I don't expect it to be alive real soon.

Errors/messages:
cvs server: Updating kernel-janitor
cvs server: failed to create lock directory for `/home/CVS/kernel-janitor' (/home/CVS/kernel-janitor/#cvs.lock): Permission denied
cvs server: failed to obtain dir lock in repository `/home/CVS/kernel-janitor'
cvs [server aborted]: read lock failed - giving up


--
~Randy

--===============36722482977022053==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36722482977022053==--
