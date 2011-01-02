From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 02 Jan 2011 21:01:33 +0000
Subject: [PATCHv3 0/4] staging: keucr: Use memcmp() & memcpy() instead of custom String[Cmp|Copy] functions
Message-Id: <1294002097-3058-1-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

This patchset make some cleanup to staging/keucr. Use memcmp and memcpy ins=
tead of custom functions.
Also some style cleanups recomended by Dan Carpenter, Joe Perches and G=C3=
=A1bor Stefanik.

The patches in this patchset are the following:

[PATCH 1/3] staging: keucr: Use memcmp() instead custom StringCmp() and som=
e style cleanups
[PATCH 2/3] staging: keucr: Use memcpy() instead custom StringCopy() and so=
me style cleanups
[PATCH 3/3] staging: keucr: Delete StringCmp() and StringCopy custom functi=
ons
[PATCH 4/4] staging: keucr: Delete use kernel strcmp() & strcpy() from TODO=
 file
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
