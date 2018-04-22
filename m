From: Steve French <smfrench@gmail.com>
Date: Sun, 22 Apr 2018 15:30:00 +0000
Subject: Re: [patch] CIFS: set *resp_buf_type to NO_BUFFER on error
Message-Id: <CAH2r5mvJMNQuwBnb7-GZ7oF7KuWfAjdQNVbAaNGPFSc4tWZ23w@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="001a1149a1ea6ac43a056a719903"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131841.GC31552@mwanda>
In-Reply-To: <20170207131841.GC31552@mwanda>
To: kernel-janitors@vger.kernel.org

--001a1149a1ea6ac43a056a719903
Content-Type: text/plain; charset="UTF-8"

Looks like missed merging this one.  The code paths have changed
around this - but on error they seem to ignore the resp_buf_type
field, but looks like it would be cleaner to initialize it, so created
an updated patch to do roughly the same thing and merged into
cifs-2.6.git for-next


Dan,
Any objections?

On Tue, Feb 7, 2017 at 7:00 PM, Pavel Shilovsky <piastryyy@gmail.com> wrote:
> 2017-02-07 5:18 GMT-08:00 Dan Carpenter <dan.carpenter@oracle.com>:
>> We recently shuffled this code around and introduced a new error path
>> before *resp_buf_type gets initialized.  It creates uninitialized
>> variable bugs in the callers.
>>
>>     fs/cifs/smb2pdu.c:579 SMB2_negotiate()
>>     error: uninitialized symbol 'resp_buftype'.
>>
>> Fixes: 738f9de5cdb9 ("CIFS: Send RFC1001 length in a separate iov")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
>> index 526f0533cb4e..8fa5e058fb15 100644
>> --- a/fs/cifs/transport.c
>> +++ b/fs/cifs/transport.c
>> @@ -807,6 +807,8 @@ SendReceive2(const unsigned int xid, struct cifs_ses *ses,
>>         struct kvec *new_iov;
>>         int rc;
>>
>> +       *resp_buf_type = CIFS_NO_BUFFER; /* no response buf yet */
>> +
>>         new_iov = kmalloc(sizeof(struct kvec) * (n_vec + 1), GFP_KERNEL);
>>         if (!new_iov)
>>                 return -ENOMEM;
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-cifs" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> Good catch, thanks!
>
> Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>
>
> --
> Best regards,
> Pavel Shilovsky
>



-- 
Thanks,

Steve

--001a1149a1ea6ac43a056a719903
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-CIFS-set-resp_buf_type-to-NO_BUFFER-on-error.patch"
Content-Disposition: attachment; 
	filename="0001-CIFS-set-resp_buf_type-to-NO_BUFFER-on-error.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jgayxqdy0

RnJvbSBjMDljMTM2NjhmNjI0ZWRlMzM2NDg5ZWY4NDEyYzI0NzFjNWMzYWZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHNtZnJlbmNoQGdtYWlsLmNvbT4KRGF0
ZTogU3VuLCAyMiBBcHIgMjAxOCAxMDoyNDoxOSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIENJRlM6
IHNldCAqcmVzcF9idWZfdHlwZSB0byBOT19CVUZGRVIgb24gZXJyb3IKCkRhbiBDYXJwZW50ZXIg
aGFkIHBvaW50ZWQgdGhpcyBvdXQgYSB3aGlsZSBhZ28sIGJ1dCB0aGUgY29kZSBhcm91bmQKdGhp
cyBoYWQgY2hhbmdlZCBzbyB3YXNuJ3QgY2F1c2luZyBhbnkgcHJvYmxlbXMgc2luY2UgdGhhdCBm
aWVsZAp3YXMgbm90IHVzZWQgaW4gdGhpcyBlcnJvciBwYXRoLgoKU3RpbGwsIGl0IGlzIGNsZWFu
ZXIgdG8gYWx3YXlzIGluaXRpYWxpemUgdGhpcyBmaWVsZCwgc28gY2hhbmdpbmcKdGhlIGVycm9y
IHBhdGggdG8gc2V0IGl0LgoKQ0M6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xl
LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzbWZyZW5jaEBnbWFpbC5jb20+Ci0t
LQogZnMvY2lmcy90cmFuc3BvcnQuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9jaWZzL3RyYW5zcG9ydC5j
IGIvZnMvY2lmcy90cmFuc3BvcnQuYwppbmRleCA4ZjZmMjU5MTgyMjkuLjNmYjBlNDMzYjhlMiAx
MDA2NDQKLS0tIGEvZnMvY2lmcy90cmFuc3BvcnQuYworKysgYi9mcy9jaWZzL3RyYW5zcG9ydC5j
CkBAIC04MzQsOCArODM0LDExIEBAIFNlbmRSZWNlaXZlMihjb25zdCB1bnNpZ25lZCBpbnQgeGlk
LCBzdHJ1Y3QgY2lmc19zZXMgKnNlcywKIAlpZiAobl92ZWMgKyAxID4gQ0lGU19NQVhfSU9WX1NJ
WkUpIHsKIAkJbmV3X2lvdiA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCBrdmVjKSAqIChuX3ZlYyAr
IDEpLAogCQkJCSAgR0ZQX0tFUk5FTCk7Ci0JCWlmICghbmV3X2lvdikKKwkJaWYgKCFuZXdfaW92
KSB7CisJCQkvKiBvdGhlcndpc2UgY2lmc19zZW5kX3JlY3YgYmVsb3cgc2V0cyByZXNwX2J1Zl90
eXBlICovCisJCQkqcmVzcF9idWZfdHlwZSA9IENJRlNfTk9fQlVGRkVSOwogCQkJcmV0dXJuIC1F
Tk9NRU07CisJCX0KIAl9IGVsc2UKIAkJbmV3X2lvdiA9IHNfaW92OwogCi0tIAoyLjE0LjEKCg==
--001a1149a1ea6ac43a056a719903--
