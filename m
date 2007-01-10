From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 10 Jan 2007 08:25:55 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <Pine.LNX.4.64.0701100314420.11530@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-691956866-1168417555=:11530"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-691956866-1168417555=:11530
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 9 Jan 2007, Martin Olsen wrote:

> On Tuesday 09 January 2007 19:57, Robert P. J. Day wrote:
> > so ... who's up for it?
>
> I'd love to take a crack on this.
>
> I have yet to submit my first patch to The Kernel so if anyone would
> like to support me while doing this it would be great.

to help you get things going, i've attached my style.sh script, which
scans the source tree to find questionable constructs that might
represent possible cleanups.  in the attached version, i've commented
out every check except for the power of 2 stuff, so you can see the
potential for cleanup.

(note how i've specifically scanned for the four similar variations of
the test, depending on the possibility for parentheses.  if someone
knows a better way to express these patterns that would handle
matching parentheses (without getting into perl, that is), i'd love to
hear it.)

note how almost all of the tests are just one of those variations.  a
couple notes:

1) ignore the FIND_FIRST_BIT macro in cardbus.c -- i've already
submitted a patch to delete that entirely, it's useless.

2) for the time being, don't mess with anything related to powerpc --
i get the impression they do things differently there so just give
that a pass for now.

  first things first, though -- let's see a proposed power_of_2.h
header file with inline functions:

  is_power_of_2(x)
  round_up_to_power_of_2(x)
  round_down_to_power_of_2(x)

rday
--8323328-691956866-1168417555=:11530
Content-Type: APPLICATION/x-sh; name=style.sh
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.64.0701100325550.11530@localhost.localdomain>
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
a2NhbGxvYyA/XCgxLCIgJHtESVJ9CgojIGVjaG8gLWUgIlxuPT09PT0gV2hl
cmUgQVJSQVlfU0laRSgpIG1pZ2h0IGJlIHVzZWQgLi4uXG4iCiMgZ3JlcCAt
RXIgInNpemVvZiA/XCg/KFteXCldKylcKT8gPy8gP3NpemVvZiA/XCg/Lipc
MS4qIiAke0RJUn0KCiMgZWNobyAtZSAiXG49PT09PSBXaGVyZSBGSUVMRF9T
SVpFKCkgbWlnaHQgYmUgdXNlZCAuLi5cbiIKIyBncmVwIC1FciAic2l6ZW9m
ID9cKCA/XCggP1woW15cKl0qW14gXSA/XCpcKSA/MCA/XCktPlteXCldK1wp
IiAke0RJUn0KCiMgZWNobyAtZSAiXG49PT09PSBQZW9wbGUgd2hvIHNlZW0g
dG8gYmUgcmVkZWZpbmluZyBNQVgoKSBvciBNSU4oKSAuLi5cbiIKIyBncmVw
IC1FciAiIyAqZGVmaW5lICsobWlufE1JTnxtYXh8TUFYKSAqXCgiICR7RElS
fQoKIwojICBTb21lIHNpbXBsaWZ5aW5nIHRyYW5zZm9ybWF0aW9ucyB1c2lu
ZyBhbiBvcmRlciB2YWx1ZSBvZiB6ZXJvLiAgQWxsCiMgb2YgdGhlc2UgbWFj
cm9zIGFyZSBkZWZpbmVkIGluIGluY2x1ZGUvbGludXgvZ2ZwLmguCiMKIyAj
ZGVmaW5lIGFsbG9jX3BhZ2UoZ2ZwX21hc2spIGFsbG9jX3BhZ2VzKGdmcF9t
YXNrLCAwKQojICNkZWZpbmUgX19nZXRfZnJlZV9wYWdlKGdmcF9tYXNrKSBf
X2dldF9mcmVlX3BhZ2VzKChnZnBfbWFzayksMCkKIyAjZGVmaW5lIF9fZnJl
ZV9wYWdlKHBhZ2UpIF9fZnJlZV9wYWdlcygocGFnZSksIDApCiMgI2RlZmlu
ZSBmcmVlX3BhZ2UoYWRkcikgZnJlZV9wYWdlcygoYWRkciksMCkKCiMgZWNo
byAtZSAiXG49PT09PSBBbGxvY2F0aW9uIHJvdXRpbmVzIHRoYXQgdXNlIGFu
IG9yZGVyIG9mIHplcm8gLi4uXG4iCiMgZ3JlcCAtRXIgIihhbGxvY3xmcmVl
KV9wYWdlcyA/XChbXixdKywgPzAiICR7RElSfQoKIwojICBTaG9ydCBmb3Jt
IGZvciBETUEgcGFnZXMuCiMKIyAjZGVmaW5lIF9fZ2V0X2RtYV9wYWdlcyhn
ZnBfbWFzaywgb3JkZXIpIF9fZ2V0X2ZyZWVfcGFnZXMoKGdmcF9tYXNrKSB8
IEdGUF9ETUEsKG9yZGVyKSkKCiMgZWNobyAtZSAiXG49PT09PSBfX2dldF9m
cmVlX3BhZ2VzKCkgLT4gX19nZXRfZG1hX3BhZ2VzKCkgLi4uXG4iCiMgZ3Jl
cCAtRXIgIl9fZ2V0X2ZyZWVfcGFnZXMuKkdGUF9ETUEiICR7RElSfQoKIyBl
Y2hvIC1lICJcbj09PT09IFRoaW5ncyB0aGF0IG1pZ2h0IGJlIHJlcGxhY2Vk
IGJ5IERJVl9ST1VORF9VUCgpIC4uLlxuIgojIGdyZXAgLUVyICIgPysgPyhb
XiAtXSspID8tID8xXCkgPy8gP1wxIiAke0RJUn0KCiMgZWNobyAtZSAiXG49
PT09PSBDYWxscyB0byBtZW1zZXQoKSB0aGF0IG1pZ2h0IGJlIHJlcGxhY2Vk
IGJ5IGNsZWFyX3BhZ2UoKSAuLi5cbiIKIyBncmVwIC1FciAibWVtc2V0ID9c
KFteLF0rLCA/MCwgP1BBR0VfU0laRVwpIiAke0RJUn0gfCBncmVwIC12ICIj
ZGVmaW5lIGNsZWFyX3BhZ2UiCgplY2hvIC1lICJcbj09PT09IFBsYWNlcyB0
aGF0IG1pZ2h0IHJlcHJlc2VudCBhIGNhbGwgdG8gaXNfcG93ZXJfb2ZfMigp
IC4uLlxuIgplY2hvIC1lICIJeCAmICh4IC0gMSk6XG4iCmdyZXAgLUVyICIo
W15cKFwpXSspID9cJiA/XChcMSA/LSA/MVwpIiAke0RJUn0KZWNobyAtZSAi
CXggJiAoKHgpIC0gMSk6XG4iCmdyZXAgLUVyICIoW15cKFwpXSspID9cJiA/
XChcKFwxXCkgPy0gPzFcKSIgJHtESVJ9CmVjaG8gLWUgIgkoeCkgJiAoeCAt
IDEpOlxuIgpncmVwIC1FciAiXCgoW15cKFwpXSspXCkgP1wmID9cKFwxID8t
ID8xXCkiICR7RElSfQplY2hvIC1lICIJKHgpICYgKCh4KSAtIDEpOlxuIgpn
cmVwIC1FciAiXCgoW15cKFwpXSspXCkgP1wmID9cKFwoXDFcKSA/LSA/MVwp
IiAke0RJUn0KCmVjaG8gLWUgIlxuRG9uZS4iCg==

--8323328-691956866-1168417555=:11530
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--8323328-691956866-1168417555=:11530--
