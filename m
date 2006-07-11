From: "tom hisch" <t.hisch@gmail.com>
Date: Tue, 11 Jul 2006 16:47:14 +0000
Subject: [KJ] thread_info.h use kzalloc
Message-Id: <8ef77f2e0607110947j6fd6ec3fgb180f05ca8654eb8@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0574873313=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0574873313==
Content-Type: multipart/alternative;
    boundary="----------=_1152636502-4876-306"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1152636502-4876-306
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hello,

i have some questions about the alloc_thread_info(tsk) macro in
asm-i386/thread_info.h


/* thread information allocation */
#ifdef CONFIG_DEBUG_STACK_USAGE
#define alloc_thread_info(tsk)                                  \
        ({                                                      \
                struct thread_info *ret;                        \
                                                                \
------>      ret = kmalloc(THREAD_SIZE, GFP_KERNEL);         \  //  what
about the use of kzalloc ??
                if (ret)                                        \
                        memset(ret, 0, THREAD_SIZE);            \
------>      ret;                                            \    // whats
the meaning of this instruction ??
        })
#else
#define alloc_thread_info(tsk) kmalloc(THREAD_SIZE, GFP_KERNEL)
#endif

thanks
tom hisch

------------=_1152636502-4876-306
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Disposition: inline

aGVsbG8sPGJyPjxicj5pIGhhdmUgc29tZSBxdWVzdGlvbnMgYWJvdXQgdGhl
IGFsbG9jX3RocmVhZF9pbmZvKHRzaykgbWFjcm8gaW4gYXNtLWkzODYvdGhy
ZWFkX2luZm8uaDxicj48YnI+PGJyPi8qIHRocmVhZCBpbmZvcm1hdGlvbiBh
bGxvY2F0aW9uICovPGJyPiNpZmRlZiBDT05GSUdfREVCVUdfU1RBQ0tfVVNB
R0U8YnI+I2RlZmluZSBhbGxvY190aHJlYWRfaW5mbyh0c2spJm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IFwKPGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyAoeyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyBcPGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBzdHJ1Y3QgdGhyZWFkX2luZm8g
KnJldDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgXDxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgXDxicj4tLS0tLS0m
Z3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldCA9IGttYWxs
b2MoVEhSRUFEX1NJWkUsIEdGUF9LRVJORUwpOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBcJm5ic3A7IC8vJm5i
c3A7IHdoYXQgYWJvdXQgdGhlIHVzZSBvZiBremFsbG9jID8/Cjxicj4mbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYg
KHJldCkmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgXDxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgbWVtc2V0KHJldCwgMCwgVEhSRUFE
X1NJWkUpOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBcPGJyPi0tLS0tLSZndDsg
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgXCZuYnNwOyZuYnNwOyZuYnNwOyAvLyB3aGF0
cyB0aGUgbWVhbmluZyBvZiB0aGlzIGluc3RydWN0aW9uID8/Cjxicj4mbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfSk8YnI+
I2Vsc2U8YnI+I2RlZmluZSBhbGxvY190aHJlYWRfaW5mbyh0c2spIGttYWxs
b2MoVEhSRUFEX1NJWkUsIEdGUF9LRVJORUwpPGJyPiNlbmRpZjxicj48YnI+
dGhhbmtzPGJyPnRvbSBoaXNjaDxicj48YnI+Cg==

------------=_1152636502-4876-306--

--===============0574873313==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0574873313==--
