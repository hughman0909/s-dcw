.class public final Lcom/kithub/ransomlock/CryptoChecker;
.super Ljava/lang/Object;
.source "CryptoChecker.java"


# static fields
.field private static final DECRYPT_KEY:Ljava/lang/String; = "KITHUB{e4sy_pl4in_str1ng}"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkKey(Ljava/lang/String;)Z
    .locals 1
    .param p0, "input"    # Ljava/lang/String;

    .line 10
    if-nez p0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 11
    :cond_0
    const-string v0, "KITHUB{e4sy_pl4in_str1ng}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
