From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 20 Apr 2004 21:07:45 +0000
Subject: Re: [Kernel-janitors] cvs
Message-Id: <20040420140745.0097303d.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30311442142370715=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0404192024020.30414@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0404192024020.30414@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============30311442142370715==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

| | 
| | FYI, this server (same as kernelnewbies.org) was "compromised"
| | a couple of months ago and may not be back completely yet.
| | I'll keep trying other combinations to see if anything
| | works for me, and if so, let you know.
| 
| I have an account on nl.linux.org and still cannot check out
| files from CVS.  :(
| I'll check on it, but I don't expect it to be alive real soon.
| 
| Errors/messages:
| cvs server: Updating kernel-janitor
| cvs server: failed to create lock directory for `/home/CVS/kernel-janitor' (/home/CVS/kernel-janitor/#cvs.lock): Permission denied
| cvs server: failed to obtain dir lock in repository `/home/CVS/kernel-janitor'
| cvs [server aborted]: read lock failed - giving up

So.... this problem has been fixed (/etc/group file problem).
This means that people with an account on nl.linux.org can
access CVS there now.  However, that doesn't help other people
who want to use anonymous CVS access.  I'm still trying to work
with the admins at nl.linux.org on that issue.... sorry.

--
~Randy

--===============30311442142370715==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30311442142370715==--
