From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 22 Jan 2007 08:58:48 +0000
Subject: [KJ] what's the merge window for janitor fixups?
Message-Id: <Pine.LNX.4.64.0701220349560.21161@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-11482103-1169456328=:21161"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-11482103-1169456328=:21161
Content-Type: TEXT/PLAIN; charset=US-ASCII


  what's the merge window for all of these patches submitted through
the KJ list to get into the main git tree?  from somewhere, i recall
that there's one frantic merge that happens for two weeks after a new
release, but it's not clear that that's enough time to get in
everything that deserves to be merged.

  as an example, i've attached my current style script which scans the
tree looking for obvious cleanups (some of which i already know have
been submitted and ACKed, so not *all* of that is relevant -- i'm just
showing the results against the latest "git pull" of linus' tree.)

  as one example, you can see how much code can be simplified by using
the ARRAY_SIZE() macro.  there's over 250 lines, and it makes sense
that all of that should be changed since that process is already
underway.  but if it's going to be done subsystem by subsystem, it's
not clear whether it can all get done by the time the merge window
closes.  and i'm guessing it would be at least a little frustrating
for someone working on a patch to suddenly get its merging cut off
until the next major release.

  so what's the policy on when merges are accepted into the main git
repo?  knowing that would make a difference in how people schedule
their efforts to do any cleanup.

rday
--0-11482103-1169456328=:21161
Content-Type: APPLICATION/x-sh; name=style.sh
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.64.0701220358480.21161@CPE00045a9c397f-CM001225dbafb6>
Content-Description: 
Content-Disposition: attachment; filename=style.sh

IyEvYmluL3NoCgpESVI9JHsxLS59CgojIGVjaG8gLWUgIlxuPT09PT0gRGVw
cmVjYXRlZCBLY29uZmlnICdkZXBlbmRzJywgc2hvdWxkIGJlICdkZXBlbmRz
IG9uJyAuLi5cbiIKIyBncmVwIGRlcGVuZHMgJChmaW5kICR7RElSfSAtbmFt
ZSBLY29uZmlnKSB8IGdyZXAgLXYgImRlcGVuZHMgb24iCgojIGVjaG8gLWUg
IlxuPT09PT0gQW55IHJlbWFpbmluZyByZWZlcmVuY2VzIHRvIHRoZSBvYnNv
bGV0ZSBkcml2ZXJmcz8gLi4uXG4iCiMgZ3JlcCAtciBkcml2ZXJmcyAke0RJ
Un0KCiMgZWNobyAtZSAiXG49PT09PSBQb3RlbnRpYWxseSB1bm5lY2Vzc2Fy
eSBjYXN0aW5nIG9mIGtbY216XWFsbG9jKCkgY2FsbHMgLi4uXG4iCiMgZ3Jl
cCAtRXIgIlwoW15cKVwqXStcKlwpID9rW2Ntel1hbGxvYyA/XCgiICR7RElS
fQoKIyBlY2hvIC1lICJcbj09PT09IGtjYWxsb2MoMSwuLi4pIGNhbGxzIHRo
YXQgc2hvdWxkIGJlIGt6YWxsb2MoLi4uKSAuLi5cbiIKIyBncmVwIC1FciAi
a2NhbGxvYyA/XCgxLCIgJHtESVJ9CgplY2hvIC1lICJcbj09PT09IFdoZXJl
IEFSUkFZX1NJWkUoKSBtaWdodCBiZSB1c2VkIC4uLlxuIgpncmVwIC1FciAi
c2l6ZW9mID9cKD8oW15cKV0rKVwpPyA/LyA/c2l6ZW9mID9cKD8uKlwxLioi
ICR7RElSfQoKIyBlY2hvIC1lICJcbj09PT09IFdoZXJlIEZJRUxEX1NJWkUo
KSBtaWdodCBiZSB1c2VkIC4uLlxuIgojIGdyZXAgLUVyICJzaXplb2YgP1wo
ID9cKCA/XChbXlwqXSpbXiBdID9cKlwpID8wID9cKS0+W15cKV0rXCkiICR7
RElSfQoKIyBlY2hvIC1lICJcbj09PT09IFBlb3BsZSB3aG8gc2VlbSB0byBi
ZSByZWRlZmluaW5nIE1BWCgpIG9yIE1JTigpIC4uLlxuIgojIGdyZXAgLUVy
ICIjICpkZWZpbmUgKyhtaW58TUlOfG1heHxNQVgpICpcKCIgJHtESVJ9Cgoj
CiMgIFNvbWUgc2ltcGxpZnlpbmcgdHJhbnNmb3JtYXRpb25zIHVzaW5nIGFu
IG9yZGVyIHZhbHVlIG9mIHplcm8uICBBbGwKIyBvZiB0aGVzZSBtYWNyb3Mg
YXJlIGRlZmluZWQgaW4gaW5jbHVkZS9saW51eC9nZnAuaC4KIwojICNkZWZp
bmUgYWxsb2NfcGFnZShnZnBfbWFzaykgYWxsb2NfcGFnZXMoZ2ZwX21hc2ss
IDApCiMgI2RlZmluZSBfX2dldF9mcmVlX3BhZ2UoZ2ZwX21hc2spIF9fZ2V0
X2ZyZWVfcGFnZXMoKGdmcF9tYXNrKSwwKQojICNkZWZpbmUgX19mcmVlX3Bh
Z2UocGFnZSkgX19mcmVlX3BhZ2VzKChwYWdlKSwgMCkKIyAjZGVmaW5lIGZy
ZWVfcGFnZShhZGRyKSBmcmVlX3BhZ2VzKChhZGRyKSwwKQoKIyBlY2hvIC1l
ICJcbj09PT09IEFsbG9jYXRpb24gcm91dGluZXMgdGhhdCB1c2UgYW4gb3Jk
ZXIgb2YgemVybyAuLi5cbiIKIyBncmVwIC1FciAiKGFsbG9jfGZyZWUpX3Bh
Z2VzID9cKFteLF0rLCA/MCIgJHtESVJ9CgojCiMgIFNob3J0IGZvcm0gZm9y
IERNQSBwYWdlcy4KIwojICNkZWZpbmUgX19nZXRfZG1hX3BhZ2VzKGdmcF9t
YXNrLCBvcmRlcikgX19nZXRfZnJlZV9wYWdlcygoZ2ZwX21hc2spIHwgR0ZQ
X0RNQSwob3JkZXIpKQoKIyBlY2hvIC1lICJcbj09PT09IF9fZ2V0X2ZyZWVf
cGFnZXMoKSAtPiBfX2dldF9kbWFfcGFnZXMoKSAuLi5cbiIKIyBncmVwIC1F
ciAiX19nZXRfZnJlZV9wYWdlcy4qR0ZQX0RNQSIgJHtESVJ9CgojIGVjaG8g
LWUgIlxuPT09PT0gVGhpbmdzIHRoYXQgbWlnaHQgYmUgcmVwbGFjZWQgYnkg
RElWX1JPVU5EX1VQKCkgLi4uXG4iCiMgZ3JlcCAtRXIgIiA/KyA/KFteIC1d
KykgPy0gPzFcKSA/LyA/XDEiICR7RElSfQoKIyBlY2hvIC1lICJcbj09PT09
IENhbGxzIHRvIG1lbXNldCgpIHRoYXQgbWlnaHQgYmUgcmVwbGFjZWQgYnkg
Y2xlYXJfcGFnZSgpIC4uLlxuIgojIGdyZXAgLUVyICJtZW1zZXQgP1woW14s
XSssID8wLCA/UEFHRV9TSVpFXCkiICR7RElSfSB8IGdyZXAgLXYgIiNkZWZp
bmUgY2xlYXJfcGFnZSIKCiMgZWNobyAtZSAiXG49PT09PSBQbGFjZXMgdGhh
dCBtaWdodCByZXByZXNlbnQgYSBjYWxsIHRvIGlzX3Bvd2VyX29mXzIoKSAu
Li5cbiIKIyBlY2hvIC1lICIJeCAmICh4IC0gMSk6XG4iCiMgZ3JlcCAtRXIg
IihbXlwoXCldKykgP1wmID9cKFwxID8tID8xXCkiICR7RElSfQojIGVjaG8g
LWUgIgl4ICYgKCh4KSAtIDEpOlxuIgojIGdyZXAgLUVyICIoW15cKFwpXSsp
ID9cJiA/XChcKFwxXCkgPy0gPzFcKSIgJHtESVJ9CiMgZWNobyAtZSAiCSh4
KSAmICh4IC0gMSk6XG4iCiMgZ3JlcCAtRXIgIlwoKFteXChcKV0rKVwpID9c
JiA/XChcMSA/LSA/MVwpIiAke0RJUn0KIyBlY2hvIC1lICIJKHgpICYgKCh4
KSAtIDEpOlxuIgojIGdyZXAgLUVyICJcKChbXlwoXCldKylcKSA/XCYgP1wo
XChcMVwpID8tID8xXCkiICR7RElSfQoKIyBlY2hvIC1lICJcbj09PT09IEhv
dyBtYW55IGRpZmZlcmVudCB3YXlzIGFyZSB0aGVyZSB0byBkZWZpbmUgYSBi
b29sZWFuPyAuLi5cbiIKIyBncmVwIC1yaSAiXnR5cGVkZWYuKmJvb2wiICR7
RElSfQplY2hvIC1lICJcbkRvbmUuIgo=

--0-11482103-1169456328=:21161
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--0-11482103-1169456328=:21161--
