USE [master]
GO

/****** Object:  Database [supermarketsale_source]    Script Date: 12/18/2023 1:48:47 PM ******/
CREATE DATABASE [supermarketsale_source]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'supermarketsale_source', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\supermarketsale_source.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'supermarketsale_source_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\supermarketsale_source_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [supermarketsale_source].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [supermarketsale_source] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [supermarketsale_source] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [supermarketsale_source] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [supermarketsale_source] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [supermarketsale_source] SET ARITHABORT OFF 
GO

ALTER DATABASE [supermarketsale_source] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [supermarketsale_source] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [supermarketsale_source] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [supermarketsale_source] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [supermarketsale_source] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [supermarketsale_source] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [supermarketsale_source] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [supermarketsale_source] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [supermarketsale_source] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [supermarketsale_source] SET  ENABLE_BROKER 
GO

ALTER DATABASE [supermarketsale_source] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [supermarketsale_source] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [supermarketsale_source] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [supermarketsale_source] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [supermarketsale_source] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [supermarketsale_source] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [supermarketsale_source] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [supermarketsale_source] SET RECOVERY FULL 
GO

ALTER DATABASE [supermarketsale_source] SET  MULTI_USER 
GO

ALTER DATABASE [supermarketsale_source] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [supermarketsale_source] SET DB_CHAINING OFF 
GO

ALTER DATABASE [supermarketsale_source] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [supermarketsale_source] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [supermarketsale_source] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [supermarketsale_source] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [supermarketsale_source] SET QUERY_STORE = OFF
GO

ALTER DATABASE [supermarketsale_source] SET  READ_WRITE 
GO

