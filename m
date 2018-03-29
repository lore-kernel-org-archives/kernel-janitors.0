From: "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>
Date: Thu, 29 Mar 2018 16:31:31 +0000
Subject: Re: [Intel-wired-lan] [PATCH net-next] ice: Fix error return code in ice_init_hw()
Message-Id: <1522341089.15392.172.camel@intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-SLzJKHtcu8o8kU+4YN2k"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522241445-77090-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522241445-77090-1-git-send-email-weiyongjun1@huawei.com>
To: "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

--=-SLzJKHtcu8o8kU+4YN2k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-03-28 at 12:50 +0000, Wei Yongjun wrote:
> Fix to return error code ICE_ERR_NO_MEMORY from the alloc error
> handling case instead of 0, as done elsewhere in this function.
>=20
> Fixes: dc49c7723676 ("ice: Get MAC/PHY/link info and scheduler
> topology")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/ethernet/intel/ice/ice_common.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/intel/ice/ice_common.c
> b/drivers/net/ethernet/intel/ice/ice_common.c
> index 385f5d4..21977ec 100644
> --- a/drivers/net/ethernet/intel/ice/ice_common.c
> +++ b/drivers/net/ethernet/intel/ice/ice_common.c
> @@ -468,8 +468,10 @@ enum ice_status ice_init_hw(struct ice_hw *hw)
>  	mac_buf_len =3D sizeof(struct ice_aqc_manage_mac_read_resp);
>  	mac_buf =3D devm_kzalloc(ice_hw_to_dev(hw), mac_buf_len,
> GFP_KERNEL);
> =20
> -	if (!mac_buf)
> +	if (!mac_buf) {
> +		status =3D ICE_ERR_NO_MEMORY;
>  		goto err_unroll_fltr_mgmt_struct;
> +	}
> =20
>  	status =3D ice_aq_manage_mac_read(hw, mac_buf, mac_buf_len,
> NULL);
>  	devm_kfree(ice_hw_to_dev(hw), mac_buf);
>=20

Acked-by: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>

Thanks!
Ani
--=-SLzJKHtcu8o8kU+4YN2k
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKkTCCBOsw
ggPToAMCAQICEFLpAsoR6ESdlGU4L6MaMLswDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UEBhMCU0Ux
FDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5hbCBUVFAgTmV0
d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0xMzAzMTkwMDAwMDBa
Fw0yMDA1MzAxMDQ4MzhaMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
4LDMgJ3YSVX6A9sE+jjH3b+F3Xa86z3LLKu/6WvjIdvUbxnoz2qnvl9UKQI3sE1zURQxrfgvtP0b
Pgt1uDwAfLc6H5eqnyi+7FrPsTGCR4gwDmq1WkTQgNDNXUgb71e9/6sfq+WfCDpi8ScaglyLCRp7
ph/V60cbitBvnZFelKCDBh332S6KG3bAdnNGB/vk86bwDlY6omDs6/RsfNwzQVwo/M3oPrux6y6z
yIoRulfkVENbM0/9RrzQOlyK4W5Vk4EEsfW2jlCV4W83QKqRccAKIUxw2q/HoHVPbbETrrLmE6RR
Z/+eWlkGWl+mtx42HOgOmX0BRdTRo9vH7yeBowIDAQABo4IBdzCCAXMwHwYDVR0jBBgwFoAUrb2Y
ejS0Jvf6xCZU7wO94CTLVBowHQYDVR0OBBYEFB5pKrTcKP5HGE4hCz+8rBEv8Jj1MA4GA1UdDwEB
/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMDYGA1UdJQQvMC0GCCsGAQUFBwMEBgorBgEEAYI3
CgMEBgorBgEEAYI3CgMMBgkrBgEEAYI3FQUwFwYDVR0gBBAwDjAMBgoqhkiG+E0BBQFpMEkGA1Ud
HwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwudHJ1c3QtcHJvdmlkZXIuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDoGCCsGAQUFBwEBBC4wLDAqBggrBgEFBQcwAYYeaHR0cDovL29jc3AudHJ1
c3QtcHJvdmlkZXIuY29tMDUGA1UdHgQuMCygKjALgQlpbnRlbC5jb20wG6AZBgorBgEEAYI3FAID
oAsMCWludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAKcLNo/2So1Jnoi8G7W5Q6FSPq1fmyKW3
sSDf1amvyHkjEgd25n7MKRHGEmRxxoziPKpcmbfXYU+J0g560nCo5gPF78Wd7ZmzcmCcm1UFFfIx
fw6QA19bRpTC8bMMaSSEl8y39Pgwa+HENmoPZsM63DdZ6ziDnPqcSbcfYs8qd/m5d22rpXq5IGVU
tX6LX7R/hSSw/3sfATnBLgiJtilVyY7OGGmYKCAS2I04itvSS1WtecXTt9OZDyNbl7LtObBrgMLh
ZkpJW+pOR9f3h5VG2S5uKkA7Th9NC9EoScdwQCAIw+UWKbSQ0Isj2UFL7fHKvmqWKVTL98sRzvI3
seNC4DCCBZ4wggSGoAMCAQICEzMAALP4LVwBbNmzBOoAAAAAs/gwDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEEwHhcNMTgwMjAzMDE0OTIzWhcNMTkwMTI5MDE0OTIzWjBTMSAwHgYDVQQDExdWZW5rYXRh
cmFtYW5hbiwgQW5pcnVkaDEvMC0GCSqGSIb3DQEJARYgYW5pcnVkaC52ZW5rYXRhcmFtYW5hbkBp
bnRlbC5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC2F7YFS2HtPqZ7g+dbUopN
G5+whAsBNHPs7tNMq+vnyqYvAiNaSVgcdIinobimjfXSddhQVNO+FZ5FsH40TiPlzqXCkNVnXnOM
OTYvLonxVdcymmi6Qa9bTm6Tkscx4Jhrk7ed9rhEt1rs55uf53Io/Up2bJ/NCUttt0R1zIOMkXXZ
v5n2b/QrM6bhVWxZsc8n/dQXTRDtw8fe+UblQMyLG8aNDlcBP+jZKxMQE1B00QMFoxgUh4xhRpqP
/LtIk4iBKWhqSRSc0yjVOL2HdVQN8wa1W3Lnsu0znPNFNIBxs9xRpvtjjQ+GIo4gWCOTuSkgqSdZ
Q/krdi2WdSpMN/abAgMBAAGjggJDMIICPzAdBgNVHQ4EFgQUjd2Su1q/myoK8Zv2QvQF+wlANAYw
HwYDVR0jBBgwFoAUHmkqtNwo/kcYTiELP7ysES/wmPUwZQYDVR0fBF4wXDBaoFigVoZUaHR0cDov
L3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9DUkwvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIw
SXNzdWluZyUyMENBJTIwNEEuY3JsMIGfBggrBgEFBQcBAQSBkjCBjzBpBggrBgEFBQcwAoZdaHR0
cDovL3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9jZXJ0aWZpY2F0ZXMvSW50ZWwlMjBFeHRlcm5h
bCUyMEJhc2ljJTIwSXNzdWluZyUyMENBJTIwNEEuY3J0MCIGCCsGAQUFBzABhhZodHRwOi8vb2Nz
cC5pbnRlbC5jb20vMAsGA1UdDwQEAwIHgDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiGw4x1
hJnlUYP9gSiFjp9TgpHACWeB3r05lfBDAgFkAgEJMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEE
AYI3CgMMMCkGCSsGAQQBgjcVCgQcMBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBdBgNVHREE
VjBUoDAGCisGAQQBgjcUAgOgIgwgYW5pcnVkaC52ZW5rYXRhcmFtYW5hbkBpbnRlbC5jb22BIGFu
aXJ1ZGgudmVua2F0YXJhbWFuYW5AaW50ZWwuY29tMA0GCSqGSIb3DQEBBQUAA4IBAQAFsnnyo3ix
0y3ZEIZIbdGwZankMrMPDVhiZ3PkbuGrNnB5TLDovfHY/tXrU6VQCRVK5yww/QlCXmGedpunyoio
5ZRDV2O1xA/DgA1ezipDRn+o+6DltF9MMyJN1pk1XyT3jTpNVLcuN8oVbIB87BxIhYnXaM0mfRP4
ilWzQ8EgfH9Byhtgryo55jtOLkj21F1t7a5BSrT3zgpmWljWV1tNeiPVZc+dK659cMo/IfNSody5
1+/tbaDk5dKsaLyFYkvUKBPFQvb17VNANyN43R4gpjEqvTOg+VSE/Q8B1o8/FXRgbXi+57SDmfq3
H5ocL66Zcu1tUeNBlpw5DtFFnnoKMYICFzCCAhMCAQEwgZAweTELMAkGA1UEBhMCVVMxCzAJBgNV
BAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMRSW50ZWwgQ29ycG9yYXRpb24x
KzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3VpbmcgQ0EgNEECEzMAALP4LVwBbNmz
BOoAAAAAs/gwCQYFKw4DAhoFAKBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTE4MDMyOTE2MzEyOVowIwYJKoZIhvcNAQkEMRYEFGL/yPKuzT00jx82qsNXCS057IdX
MA0GCSqGSIb3DQEBAQUABIIBAK5ketXLCb+dRTOuZqhzkwfEgzkRoAzUsaq9b930poSTEnHzuibq
VMcGTfV8GAq8CaYWPz1/QNodVNeHz0YOQKKlc1dBY+/APUbpg/9Smv3zRz/t7T7WmRseUlQ+6u+X
R2GK6qtdzpJTRRyzwH3qQHx30GcO5wU2ChY9VbkMpTcI3EQMy7xNLsw1/XYwEopx2elMmmDHL6wq
CvZUIPRoCrV8mgU50GfGRVaPK3C4/8axel4HYCq3DAQuYKw2wySKhiUC4aMz0nWBQK/BvhbH8S9T
I8UhgfxmLrMqDnzpyFgEjoDz0OXJEaTUtphPZEyQyWhXLDcmITbTvMajA5BLFcwAAAAAAAA=


--=-SLzJKHtcu8o8kU+4YN2k--
